class ListMovie < ActiveRecord::Base
  attr_accessible :list_id, :movie_name
  validates :list_id, :uniqueness => { :scope => :movie_name }  #makes sure that a movie can't be added to a list more than once
end
