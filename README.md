[![Code Climate](https://codeclimate.com/github/F3PiX/DevJournal/badges/gpa.svg)](https://codeclimate.com/github/F3PiX/DevJournal)

Rails 5 
Ruby 2.3.1
Postgresql 

Quick start guide
1 Fork repo  
2 Copy config/database.yml.example to config/database.yml. Then make sure you modify the settings so it could connect to your postgres server.  

(Inside database.yml add username and password for development and test)    

development:
  adapter: postgresql
  database: devjournal_development
  host: localhost  

3) Then install all dependencies:  

bundle install
bundle exec rake db:drop db:setup  



