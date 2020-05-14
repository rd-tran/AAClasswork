class AddArtistColumnToArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :artist_id, :integer, null: false
  end
end
