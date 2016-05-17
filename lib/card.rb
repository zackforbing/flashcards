class Card
  attr_reader :answer,
              :question

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end
