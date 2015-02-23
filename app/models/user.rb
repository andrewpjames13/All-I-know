class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: :true
  # validates_confirmation_of :password
  # validates_presence_of :password_confirmation, message: 'should match confirmation'
end
