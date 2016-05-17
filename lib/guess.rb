class Guess
  attr_reader :response,
              :card

  def initialize(response, card_object)
    @response = response
    @card = card_object
  end

  def response
    @response
  end

  def correct?
    if @card.answer == @response
      @correct = true
    else
      @correct = false
    end
  end
  def feedback
    if @correct
      "Correct!"
    else
      "Incorrect."
    end
  end
end
