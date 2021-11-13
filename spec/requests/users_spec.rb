require 'rails_helper'

RSpec.describe "Users API", type: :request do
  describe "GET /users" do
    it "should return all users" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
  end
end
