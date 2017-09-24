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
    @card = @guess.card
  end

  # def pick_random_card
  #   @all_cards = self.cards.where(deck_id: self.deck_id)
  #   array = @all_cards.to_a
  #   array.reject { |card| card.correct? }
  #   # @all_cards.map { |card| !card.correct? }
  #   @card = array.sample
  # end
end
