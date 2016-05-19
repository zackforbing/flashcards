require_relative 'card'
require_relative 'guess'
require_relative 'deck'
require_relative 'round'
require_relative "card_generator"

cards = CardGenerator.new("cards.txt").cards_gen
deck = Deck.new(cards)
round = Round.new(deck)
round.start
