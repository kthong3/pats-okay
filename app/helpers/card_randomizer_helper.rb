module CardRandomizerHelper
  def pick_random_card(deck_id)
    @all_cards = Card.where(deck_id: deck_id)
    @card = @all_cards.sample
  end
end

helpers CardRandomizerHelper
