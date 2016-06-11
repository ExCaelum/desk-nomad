class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
