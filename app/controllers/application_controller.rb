class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_admin

  def set_admin
    return create_admin_method unless User.find_by(email: "admin@gmail.com")
  end

  private

  def create_admin_method
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
