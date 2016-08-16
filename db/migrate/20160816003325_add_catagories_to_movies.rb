class AddCatagoriesToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :catagories, :string
  end
end
