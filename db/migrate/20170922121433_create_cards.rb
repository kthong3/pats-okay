class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :question, { null: false }
      t.string :answer, { null: false }
      t.integer :deck_id

      t.timestamps
    end
  end
end
