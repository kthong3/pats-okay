class Round < ApplicationRecord
  has_many :guesses
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck

  validates :user_id, :deck_id, { :presence => true }
end
