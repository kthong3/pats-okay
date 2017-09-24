class Round < ApplicationRecord
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck

  validates :user_id, :deck_id, { :presence => true }
  after_save :create_guesses

  def create_guesses
    self.deck.cards.each do |card|
      Guess.create(round_id: self.id, card_id: card.id)
    end
  end

  def pick_random_card
    @guesses = self.guesses.where(completed: false)
    @guess = @guesses.sample
    @guess.card
  end

  def total_guesses
    self.guesses.reduce(0) { |sum, guess| sum + guess.counter }
  end

  def total_first_correct
    self.guesses.where(counter: 1).count
  end

end
