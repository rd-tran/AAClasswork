class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.references :likeable, polymorphic: true
    end

    add_index :likes, :user_id
    add_index :likes, [:likeable_id, :likeable_type]
  end
end