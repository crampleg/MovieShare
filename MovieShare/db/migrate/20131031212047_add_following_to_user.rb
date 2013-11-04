class AddFollowingToUser < ActiveRecord::Migration
  def change
    add_column :users, :following, :integer
  end
end
