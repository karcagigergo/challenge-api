json.array! @users do |user|
  json.extract! user, :id, :gender, :name, :location, :email, :login, :dob, :registered, :phone, :cell, :picture, :nat, :imported_t
end