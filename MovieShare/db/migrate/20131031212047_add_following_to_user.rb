class AddFollowingToUser < ActiveRecord::Migration
  def change
    add_column :users, :following_no, :integer
  end
end
