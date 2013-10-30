class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id_model
      t.integer :user_id_follower

      t.timestamps
    end
  end
end
