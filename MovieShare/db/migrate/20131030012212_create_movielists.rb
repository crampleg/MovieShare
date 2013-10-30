class CreateMovielists < ActiveRecord::Migration
  def change
    create_table :movielists do |t|
      t.string :title

      t.timestamps
    end
  end
end
