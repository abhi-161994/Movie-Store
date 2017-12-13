class AddCastToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies,:cast,:string
  end
end
