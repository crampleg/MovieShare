class WatchedMovie < ActiveRecord::Base
  attr_accessible :movies, :user_id
  
  validates :user_id, :uniqueness => true 
end
