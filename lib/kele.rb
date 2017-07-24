require 'httparty'
require 'json'
require 'roadmap'

class Kele
    include HTTParty
    include Roadmap    

    BASE_URI = 'https://www.bloc.io/api/v1'

    def initialize(email, password)
        response = self.class.post("#{BASE_URI}/sessions", body: { 'email': email, 'password': password })
        raise "Invalid email or password" if response.code == 401
        @auth_token = response['auth_token']
    end

    def get_me
        response = self.class.get("#{BASE_URI}/users/me", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_mentor_availability(id)
        response = self.class.get("#{BASE_URI}/mentors/#{id}/student_availability", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_messages(page = nil)
        if page.nil?
            response = self.class.get("#{BASE_URI}/message_threads", headers: { "authorization" => @auth_token })
            all_pages = (1..(response["count"]/10)).map do |n|
                response = self.class.get("#{BASE_URI}/message_threads", body: { page: n }, headers: { "authorization" => @auth_token })
                JSON.parse(response.body)
            end
        else
            response = self.class.get("#{BASE_URI}/message_threads", body: { page: page }, headers: { "authorization" => @auth_token })
            JSON.parse(response.body)
        end
    end

    def create_message(user_id, recipient_id, title, body)
        response = self.class.get("#{BASE_URI}/messages", body: { sender: user_id, recipient_id: recipient_id, subject: title, 'stripped-text': body }, headers: { "authorization" => @auth_token })
        puts response
    end

end