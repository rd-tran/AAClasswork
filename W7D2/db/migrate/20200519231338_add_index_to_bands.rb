class AddIndexToBands < ActiveRecord::Migration[5.2]
  def change
    remove_index :bands, name: "index_bands_on_name"
    add_index :bands, :name, unique: true
  end
end
