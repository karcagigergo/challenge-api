class ApplicationController < ActionController::Base
  before_action :set_admin
  before_action :authenticate_user!


  def set_admin
    if !User.find_by(email: "admin@gmail.com")
      case Rails.env
      when "development"
        User.create!(email: "admin@gmail.com", password: "123456", admin: true, name: "admin",
          location: "home", login: "admin", dob: "admin", picture: "admin", registered: "admin")
      when "production"
        User.create(email: "admin@gmail.com", password: "123456", admin: true, name: "admin",
          location: "home", login: "admin", dob: "admin", picture: "admin", registered: "admin")
      end
    end
  end
end
