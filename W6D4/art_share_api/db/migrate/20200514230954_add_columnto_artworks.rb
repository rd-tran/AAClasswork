class AddColumntoArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorited, :boolean
  end
end