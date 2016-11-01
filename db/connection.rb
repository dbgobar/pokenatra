require 'active_record'
require 'pry'
require 'pg'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "pokenatra_db"
)
