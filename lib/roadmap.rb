require 'httparty'
require 'json'

module Roadmap
    include HTTParty

    def get_roadmap(id)
        response = self.class.get("#{BASE_URI}/roadmaps/#{id}", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    def get_checkpoint(id)
        response = self.class.get("#{BASE_URI}/checkpoints/#{id}", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

end