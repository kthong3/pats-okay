class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :counter, { null: false }
      t.boolean :completed, { null: false }
      t.integer :round_id
      t.integer :card_id

      t.timestamps
    end
  end
end

