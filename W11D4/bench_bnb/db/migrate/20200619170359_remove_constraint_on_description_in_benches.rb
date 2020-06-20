class RemoveConstraintOnDescriptionInBenches < ActiveRecord::Migration[5.2]
  def change
    change_column_null :benches, :description, :true
  end
end
