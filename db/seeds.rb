require 'uri'
require 'pry-byebug'
require "open-uri"
require "json"
require 'rest-client'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

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
    password: 1234567,
    "name" => {
      "first" => result['name']['first'].capitalize,
      "last" => result['name']['last'].capitalize,
      "title" => result['name']['title'].capitalize
    },
    "gender" => result['gender'],
    "location" => {
      "street" => result['location']['stereet'],
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
      "age" => result['dob']['ge']
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
    "nat" => result['nat']
  )
}