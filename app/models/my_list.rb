class MyList < ActiveRecord::Base
  attr_accessible :list_name, :owner_id
  
  validates :owner_id, :uniqueness => { :scope => :list_name }  #makes sure that a user can't create multiple lists with same name
end
