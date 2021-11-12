class User < ApplicationRecord
  enum status: {
   active: 0,
   trash: 1
  }, _prefix: true
  
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
