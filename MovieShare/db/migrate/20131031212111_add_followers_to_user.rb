class AddFollowersToUser < ActiveRecord::Migration
  def change
    add_column :users, :followers_no, :integer
  end
end
