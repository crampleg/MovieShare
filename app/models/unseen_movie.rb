class UnseenMovie < ActiveRecord::Base
  attr_accessible :movie_name, :owner_id
  validates :owner_id, :uniqueness => { :scope => :movie_name }  #makes sure that same movie can't be added more than once
end
