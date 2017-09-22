class Guess < ApplicationRecord
  belongs_to :card
  belongs_to :round

  before_validation :make_counter

  def make_counter
    self.counter = 1
  end

  validates :counter, :completed, :round_id, :card_id, { :presence => true }
end
