class Card < ApplicationRecord
  has_many :guesses
  belongs_to :deck

  validates :question, :answer, :deck_id, { :presence => true }

  # def next_card
  #   @card = Deck.
  # end

  # def check_answer(user_answer)
  #   if self.answer == user_answer
  #     @correct = true
  #   else
  #     @correct = false
  #   end
  #   @correct
  # end

  # def correct?
  #   @correct
  # end
end
