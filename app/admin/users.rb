ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :phone, :cell, :nat, :imported_t, :gender, :name, :location, :login, :dob, :picture, :registered, :authentication_token, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :phone, :cell, :nat, :imported_t, :gender, :name, :location, :login, :dob, :picture, :registered, :authentication_token, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :email
    column :name
    column :admin
    column :phone
    column :cell
    column :gender
    column :location
    column :login
    column :dob
    column :picture
    column :registered
    column :created_at
    column :imported_t
    column :admin
    actions
  end
  # index do
  #   selectable_column
  #   column :id
  #   column :email
  #   column :name
  #   column :created_at
  #   column :admin
  #   actions
  # end

  form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :email
      f.input :gender
      f.input :dob
      f.input :registered
      f.input :imported_t
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.inputs "Contact" do
      f.input :phone
      f.input :cell
    end
    f.inputs "Location" do
      f.input :location
    end
    f.actions
  end
  
end
