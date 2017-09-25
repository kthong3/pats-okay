class Guess < ApplicationRecord
  belongs_to :card
  belongs_to :round

  # use guess.increment(:counter) in guess controller

  def check_answer(user_answer)
    self.card.answer == user_answer
  end

  validates :counter, :round_id, :card_id, { :presence => true }

  validates_inclusion_of :completed, in: [true, false]
end


=begin

a counter for guesses-- both cards and rounds.

increment counter everytime user makes a guess. this applies when we call stats

round.guesses
card.guesses

find_or_update/find_or_create this specific guess if the user guessed this card before we add to counter

all the card.guesses with the counter of 1 is the first try correct
or round.guesses with a counter of 1 is the first trye correct"

=end
