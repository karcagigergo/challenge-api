### Title: challenge-api

This is a REST API made with Ruby On Rails, to extract User info for a company called Pharma Inc.
I used the randomuser API (https://randomuser.me/) to schedule seeding my database with JSON.
This is also a challenge by coodeesh (https://coodesh.com/).

### Specs:
  - Rails (rails 6.1.4);
  - Ruby (ruby 3.0.0)
  - psql (PostgreSQL 12.4) - database;
  - devise (4.8.0) - for user authentication;
  - whenever (1.0.0) - for scheduling tasks;
  - jbuilder (2.11.2) - for creating JSONated views for the API;
  - ActiveAdmin (2.9.0) - Admin dashboard to manipulate data;
  - Kaminari - To paginate the result on the index page.


### How to install:

1. 
  - clone the project and create your own repository:
  - git clone git@github.com:karcagigergo/challenge-api.git --origin challenge-api your-project-name
  - your-project-name
  - git init .
  - git add .
  - git commit
  - hub create
2.  
  - install dependencies:
  - bundle install
  - yarn install

### How to use:


1. run rails s, to boot up the local server

2. the admin user is already set in ApplicationController with the following credentials: email: admin@gmail.com, password: 123456. Admin will be the first user and you have to run rails db:seed to populate the database with the first 30 users to start with.(see in db/seed.rb)

3. Admin can modify any data from users with the help of ActiveAdmin. Root page has links and after the admin logs in these links become accessible 

> (the links are: 1. to admin dashboard, 2. to api root with the first endpoint from the challenge with the message: REST Back-end Challenge 20201209 Running", 3. All users shown with GET /users)

4. All the endpoints are up and working accordingly

5. Users have an imported_t and a status field, too.

6. To schedule CRON first write this command in the command line: 'service cron status'
   If it says '* cron is not running' type this command into the command-line: sudo service cron start, and then check
   again with 'service cron status'. If it says '* cron is running' you can proceed.
   Type 'bundle exec whenever --clear-crontab' to clear the crontab then type this: "whenever --update-crontab --set environment='development'". This is to update crontab and start scheduling, you can check the crontab file with
   'crontab -l'

7. After these commands every day at 4:30 AM the scheduled task (inject 100 new customers into the database) will be done until User.count reaches 2000.
