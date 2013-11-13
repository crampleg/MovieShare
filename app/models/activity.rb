class Activity < ActiveRecord::Base
  attr_accessible :id, :listid, :movieid, :userid, :username, :moviename, :listname
end
