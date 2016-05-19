require "pry"
class Round
  attr_reader   :deck,
                :guesses,
                :current_card,
                :feedback,
                :number_correct,
                :count,
                :results

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @current_card = 0
    @finish = ""
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    guess = @guesses.last
    if guess.correct?
      @number_correct += 1
      @guesses << "Correct!"
    else
      @guesses << "Incorrect."
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
      puts "Question: #{card.question}"
      user_response = gets.chomp
      record_guess(user_response)
      puts @guesses.last
      sleep 0.5
    end
    puts "****************** Game over! ******************"#.each_char {|c| putc c ; sleep 0.05; $stdout.flush }
    sleep 0.5
    @finish = "You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
    puts @finish
  end

  def end
    results = File.new("results-#{Time.now.strftime('%Y-%m-%d-%l-%M-%P')}.txt", "w")
    results.puts("#{@guesses.each {|guess| puts guess}}")
    results.puts("#{@results}")
    results.close
  end

  def percent_correct
    (@number_correct.to_f / deck.cards.length * 100).to_i
  end
end
