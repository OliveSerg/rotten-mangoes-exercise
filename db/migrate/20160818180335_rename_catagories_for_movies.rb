class RenameCatagoriesForMovies < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :catagories, :categorie
  end
end
