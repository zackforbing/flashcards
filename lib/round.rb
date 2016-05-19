class Round
  attr_reader   :deck,
                :guesses,
                :current_card,
                :feedback,
                :number_correct,
                :count

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @current_card = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    guess = @guesses.last
    if guess.correct?
      @number_correct += 1
    end
    @current_card += 1
    guess
  end

  def start
    puts "Welcome!"
    sleep 0.5
    puts "You're playing with #{deck.count} cards."
    sleep 0.5
    deck.cards.each do |card|
      puts "-------------------------------------------------"#.each_char {|c| putc c ; sleep 0.05; $stdout.flush }
      puts "This is card number #{@current_card + 1} out of #{deck.count}."
      # binding.pry
      puts "Question: #{card.question}"
      user_response = gets.chomp
      record_guess(user_response)
      puts @guesses.last.feedback
    end
    puts "****************** Game over! ******************"#.each_char {|c| putc c ; sleep 0.05; $stdout.flush }
    sleep 0.5
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
  end

  def percent_correct
    (@number_correct.to_f / deck.cards.length * 100).to_i
  end
end
