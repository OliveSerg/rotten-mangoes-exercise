class CreateActorsMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :actors_movies do |t|
      t.references :movies, foreign_key: true
      t.references :actors

      t.timestamps
    end
  end
end
