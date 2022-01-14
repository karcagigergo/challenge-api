# Included these two lines application.rb to autoinclude everything in the 'lib' folder
# config.autoload_paths += %W(#{config.root}/lib)
# config.autoload_paths += Dir["#{config.root}/lib/**/"],
# so I could use my module UserSeeder here with its user_cron_seeder method

namespace :update do
  desc "an update system in the API that will import the data into the Database
  with the latest Random User version once a day at 4:30AM"
  task user_database: :environment do
    UserSeeder.user_cron_seeder
  end
end
