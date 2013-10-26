class User < ActiveRecord::Base
  attr_accessible :username, :firstname, :lastname, :email, :gender, :password_digest, :password, :password_confirmation
  attr_accessor :password
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :gender, :presence => true
  validates :password, :presence => true, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
end