require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "GET /api/v1/users" do
    it "should return all users" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1" do
    it "Return a message 'REST Back-end Challenge 20201209 Running'" do
      get '/api/v1'
      expect(JSON.parse(response.body)).to eq("REST Back-end Challenge 20201209 Running.")
    end
  end

  describe "POST /api/v1/user" do
    it "should create new a user" do
      post '/api/v1/users', params: { user: {
        "password": 1234567,
        "gender": "male",
        "email": "asdfg@gmail.com",
        "phone": "12345677",
        "cell": "13123123123",
        "status": "active",
        "nat": "DE",
        "name": {
          "first": "Kiss",
          "last": "Béla",
          "title": "Mr"
        },
        "location": {
          "street": {
            "number": "122",
            "name": "Blankenburgerpark"
          },
          "city": "Hellllooo",
          "state": "Borsod",
          "postcode": 3531,
          "coordinates": {
            "latitude": "-3242342",
            "longitude": "324325.53252"
          },
          "timezone": {
            "offset": "+3:50",
            "description": "Taktaszada"
          }
        },
        "picture": {
          "large": "http://randomuser.me",
          "medium": "http://randomuser.me",
          "thumbnail": "http://randomuser.me"
        }
      }
    }
      expect(response).to have_http_status(:created)
    end
  end
end
