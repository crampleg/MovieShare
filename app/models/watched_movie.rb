class WatchedMovie < ActiveRecord::Base
  attr_accessible :movies, :user_id
end
