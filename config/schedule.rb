require 'pry-byebug'
require "json"
require 'rest-client'

env :PATH, ENV['PATH']
set :output, "log/cron.log"

every 1.day, at: '4:30 am' do
  rake 'update:user_database'
end
