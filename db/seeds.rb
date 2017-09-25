require 'faker'

temp_decks = [
  {title: "Pat"},
  {title: "Outside"}
]

temp_cards = [
  {question: "What did Pat have for lunch? OPTIONS: Chicken, Raw Chicken, or Beans",
   answer: "Chicken",
   deck_id: 1 },

  {question: "What is Pat's other name? OPTIONS: Michelle, Barack, Gene",
   answer: "Michelle",
   deck_id: 1 },

  {question: "Last year halloween Pat dressed as Tina Belcher? OPTIONS: True or False",
   answer: "True",
   deck_id: 1 },

  {question: "Is Pat okay? OPTIONS: Totally, Yes, No, or I guess.",
   answer: "I guess",
   deck_id: 1 },

  {question: "Is the sky blue? True or False",
    answer: "True",
    deck_id: 2},

  {question: "Is the grass green? Yes or No",
    answer: "Yes",
    deck_id: 2},

  {question: "Do you wanna build a snowman? Yes or Yes",
      answer: "Yes",
      deck_id: 2}
]

Card.create!(temp_cards)
Deck.create!(temp_decks)


10.times do
  user = User.new(username: Faker::HeyArnold.character, password: 'password')
  user.email = Faker::Internet.safe_email(user.username)
  user.save
end
