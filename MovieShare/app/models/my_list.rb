class MyList < ActiveRecord::Base
  attr_accessible :list_id, :list_name, :owner_id
end
