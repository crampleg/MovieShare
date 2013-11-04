class CreateWatchedMovies < ActiveRecord::Migration
  def change
    create_table :watched_movies do |t|
      t.integer :user_id
      t.string :movies

      t.timestamps
    end
  end
end
