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
        },
        "login": {
          "uuid": "2c835ae5-dcdd-48af-9d82-cdffa89bef37",
          "username": "goldenleopard429",
          "password": "515000",
          "salt": "hpmM9Dw0",
          "md5": "f7faf7cc8aec82106a1bc4d6f7c5934f",
          "sha1": "037f7e217b52b26d4e07fda343af578d74efa895",
          "sha256": "3b4d33f16d0e7a07057e2e2a60e1b9e7074b830d35aeab4bb7e3346de610e8f8"
        }
      }
    }
      expect(response).to have_http_status(:created)
    end
  end
end
