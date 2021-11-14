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
      expect {
        post '/api/v1/users', params: { user: {
          "password": 1234567,
          "gender": "test",
          "email": "test@gmail.com",
          "phone": "12345677",
          "cell": "13123123123",
          "status": "active",
          "nat": "DE",
          "name": {
            "first": "test",
            "last": "test",
            "title": "test"
          },
          "location": {
            "street": {
              "number": "test",
              "name": "test"
            },
            "city": "test",
            "state": "test",
            "postcode": 3531,
            "coordinates": {
              "latitude": "-test",
              "longitude": "test.test"
            },
            "timezone": {
              "offset": "test",
              "description": "test"
            }
          },
          "picture": {
            "large": "test",
            "medium": "test",
            "thumbnail": "test"
          }
         }
        }
      }.to change { User.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE /api/v1/users/:id" do
    it "should change the users status to trash" do
      user = User.create(
          password: 1234567,
          gender: "test",
          email: "test@gmail.com",
          phone: "12345677",
          cell: "13123123123",
          status: "active",
          nat: "DE",
          name: {
            first: "test",
            last: "test",
            title: "test"
          },
          location: {
            street: {
              number: "test",
              name: "test"
            },
            city: "test",
            state: "test",
            postcode: 3531,
            coordinates: {
              latitude: "-test",
              longitude: "test.test"
            },
            timezone: {
              offset: "test",
              description: "test"
            }
          },
          picture: {
            large: "test",
            medium: "test",
            thumbnail: "test"
          }
      )

      expect {
        delete "/api/v1/users/#{user.id}"
      }.to change { user.status }.from("active").to("trash")
    end
  end

end
