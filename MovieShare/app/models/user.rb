class User < ActiveRecord::Base
  attr_accessible :username, :password_digest
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
