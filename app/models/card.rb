class Card < ApplicationRecord
  has_many :guesses
  belongs_to :deck

  validates :question, :answer, :deck_id, { :presence => true }

  # def next_card
  #   @card = Deck.
  # end

  def self.pick_random_card(deck_id)
    @all_cards = Card.where(deck_id: deck_id)
    @card = @all_cards.sample
  end

end
