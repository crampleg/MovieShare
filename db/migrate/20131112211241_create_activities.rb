class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :id
      t.integer :userid
      t.string :movieid
      t.integer :listid

      t.timestamps
    end
  end
end
