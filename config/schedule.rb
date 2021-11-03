env :PATH, ENV['PATH']
set :output, "log/cron.log"

every 2.minutes do
  rake 'sample:test'
end