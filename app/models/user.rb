class User < ActiveRecord::Base
  has_many :followers, dependent: :destroy   #when a user is deleted, the follower object should also be deleted

  attr_accessible :username, :firstname, :lastname, :email, :password_digest, :password, :password_confirmation, :following_no, :followers_no, :description
  #attr_accessor :password
  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true #, :length => { :in => 3..20 }
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true, :uniqueness => true #, :format => EMAIL_REGEX
  #validates :password, :presence => true, :confirmation => true #password_confirmation attr
  #validates_length_of :password, :in => 6..20, :on => :create
  has_secure_password
end