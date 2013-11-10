class Follower < ActiveRecord::Base
  attr_accessible :user_id_follower, :user_id_model
  validates :user_id_follower, :uniqueness => { :scope => :user_id_model }  #makes sure that a user cant follow a specific user multiple times
  
  belongs_to :user
  #Test the following to see what the output is:
  #fol = Follower.find(...)
  #puts "#{fol.user.firstname}"

end
