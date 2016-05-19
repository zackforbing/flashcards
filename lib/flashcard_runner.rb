require_relative 'card'
require_relative 'guess'
require_relative 'deck'
require_relative 'round'
require_relative "card_generator"

puts "enter a card file to use."
user_cards = gets.chomp
while File.exist?(user_cards) == false do
  case user_cards
  when ""
    cards = CardGenerator.new.cards_gen
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.start
    # round.end
    break
  else
  puts "file does not exist. please enter a card file to use."
  user_cards = gets.chomp
  end
end
cards = CardGenerator.new(user_cards).cards_gen
deck = Deck.new(cards)
round = Round.new(deck)
round.start
# round.end
