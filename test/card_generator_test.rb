require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/guess'
require_relative '../lib/deck'
require_relative '../lib/round'
require_relative '../lib/card_generator'


class CardGeneratorTest < Minitest::Test

    def test_it_is_associated_with_a_file_when_created
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert File.exist?(filename)
    end

    def test_cards_are_stored_in_an_array
      # skip
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert card_generator.is_a? Array
    end

    def test_cards_in_the_array_are_tied_to_card_class
      # skip
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert_instance_of Card, card_generator[0]
    end

    def test_card_count_in_new_deck_is_6
      # skip
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert_equal 4, card_generator.count
    end

    def test_the_correct_question_is_posed
      # skip
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert_equal "What is 5 + 5?", card_generator[0].question
    end

    def test_this_is_the_answer_i_expect
      # skip
      filename = "../lib/cards.txt"
      card_generator = CardGenerator.new(filename).cards_gen
      assert_equal "10", card_generator[0].answer
    end
  end
