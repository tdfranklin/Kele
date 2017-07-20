# kele

A Ruby Gem API client for students to access the Bloc API.
Made with my mentor Allen at bloc.io.

### Requirements

* Ruby
* You need to be a Bloc Student in order to access data.

### Install Rails

* Install Rails will set you up with Ruby, RVM and other tools you will need to build Ruby on Rails apps.

### Clone the Repo

* Navigate to the directory where you want to store the project and clone the repo with:

  $ git clone https://github.com/tdfranklin/kele.git

* Navigate to the projects directory:

  $ cd kele

* Install kele gem:

  $ gem install kele

### Usage Example

* $ irb

* $ require 'kele'

* $ kele_client = Kele.new("your@email", "password")

* Retrieve your information with:

* $ kele.get_me

### Issues

If you find any issue with the app, let me know:

https://github.com/tdfranklin/kele/issues

### Acknowledgements

[bloc.io](www.bloc.io)

### License

MIT License. © 2017 Tyler D. Franklin