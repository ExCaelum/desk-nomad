class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  enum role: %w(default admin)
  user.url = auth_hash['info']['urls'][user.provider.capitalize]
end
