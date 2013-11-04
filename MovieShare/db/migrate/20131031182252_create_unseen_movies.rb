class CreateUnseenMovies < ActiveRecord::Migration
  def change
    create_table :unseen_movies do |t|
      t.integer :owner_id
      t.string :movie_name

      t.timestamps
    end
  end
end
