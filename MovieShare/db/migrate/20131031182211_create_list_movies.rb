class CreateListMovies < ActiveRecord::Migration
  def change
    create_table :list_movies do |t|
      t.integer :list_id
      t.string :movie_name

      t.timestamps
    end
  end
end
