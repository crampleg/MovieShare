class CreateMyLists < ActiveRecord::Migration
  def change
    create_table :my_lists do |t|
      t.integer :list_id
      t.string :list_name
      t.integer :owner_id

      t.timestamps
    end
  end
end
