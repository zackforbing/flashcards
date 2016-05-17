class Round
  attr_reader :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def deck
    @deck
  end

  def guesses
    @guesses
  end
end
