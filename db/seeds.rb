require 'pry-byebug'
require "json"
require 'rest-client'

# API endpoint
url = 'https://randomuser.me/api/?results=1'

response = RestClient.get(url) 
# array to store the response
results = JSON.parse(response.body)

results["results"].each { |result|
  puts 'Destroying users...'
  User.destroy_all
  puts "Creating users..."
  user = User.create!(
    "name" => {
      "first" => result['name']['first'].capitalize,
      "last" => result['name']['last'].capitalize,
      "title" => result['name']['title'].capitalize
    },
    "gender" => result['gender'],
    "location" => {
      "street" => result['location']['street'],
      "city" => result['location']['city'],
      "state" => result['location']['state'],
      "postcode" => result['location']['postcode'],
      "coordinates" => {
        "latitude" => result['location']['coordinates']['latitude'],
        "longitude" => result['location']['coordinates']['longitude']
      },
      "timezone" => {
        "offset" => result['location']['timezone']['offset'],
        "description" => result['location']['timezone']['description']
      }
    },
    "email" => result['email'],
    "login" => {
      "uuid" => result['login']['uuid'],
      "username" => result['login']['username'],
      "password" => result['login']['password'],
      "salt" => result['login']['salt'],
      "md5" => result['login']['md5'],
      "sha1" => result['login']['sha1'],
      "sha256" => result['login']['sha256']
    },
    "dob" => {
      "date" => result['dob']['date'],
      "age" => result['dob']['age']
    },
    "registered" => {
      "date" => result['registered']['date'],
      "age" => result['registered']['age']
    },
    "phone" => result['phone'],
    "cell" => result['cell'],
    "picture" => {
      "large" => result['picture']['large'],
      "medium" => result['picture']['medium'],
      "thumbnail" => result['picture']['thumbnail']
    },
    "nat" => result['nat'],
    "imported_t" => DateTime.now.to_s(:db)
  )
}