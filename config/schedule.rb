require 'pry-byebug'
require "json"
require 'rest-client'

env :PATH, ENV['PATH']
set :output, "log/cron.log"

# every 2.minutes do
#   rake 'sample:test'
# end

every 1.day, at: '4:30 am' do
  rake 'update:user_database'
end
