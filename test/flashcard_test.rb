require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/round'

class FlashcardsTest < Minitest::Test

  def test_card_basics
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_guess_is_true
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
    assert_equal "Juneau", guess.response
    assert guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_guess_is_false
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal card, guess.card
    assert_equal "Saturn", guess.response
    refute guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

  def test_card_has_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  def test_deck_contents
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

  def test_creating_a_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
    assert_equal [], round.guesses
    assert_equal card_1, round.current_card
    round.record_guess("Juneau")
    # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
    # round.guesses.count
    # => 1
    # round.guesses.first.feedback
    # => "Correct!"
    # round.number_correct
    # => 1
    # round.current_card
    # => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
    # round.record_guess("2")
    # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
    # round.guesses.count
    # => 2
    # round.guesses.last.feedback
    # => "Incorrect."
    # round.number_correct
    # => 1
    # round.percent_correct
    # => 50
  end
end
