class ChangeLikesIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :likes, name: "index_likes_on_user_id"
    remove_index :likes, name: "index_likes_on_likeable_id_and_likeable_type"
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
