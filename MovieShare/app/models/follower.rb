class Follower < ActiveRecord::Base
  attr_accessible :user_id_follower, :user_id_model

  belongs_to :user
  #Test the following to see what the output is:
  #fol = Follower.find(...)
  #puts "#{fol.user.firstname}"

end
