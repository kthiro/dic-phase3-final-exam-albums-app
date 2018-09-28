class AddPhotographerToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :photographer, :string
  end
end
