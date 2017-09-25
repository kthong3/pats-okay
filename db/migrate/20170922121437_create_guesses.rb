class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :counter, { default: 0 }
      t.boolean :completed, { default: false }
      t.integer :round_id
      t.integer :card_id

      t.timestamps
    end
  end
end

