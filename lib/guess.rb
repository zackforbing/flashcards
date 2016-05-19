class Guess
  attr_reader :response,
              :card,
              :feedback,
              :correct

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    response == card.answer
  end
  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end
end
