class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.integer :poll_id, null: false
      t.integer :question_id, null: false
      t.string :text, null: false
    end

    add_index :answer_choices, :poll_id
    add_index :answer_choices, [:question_id, :text], unique: true
  end
end
