class Question < ActiveRecord::Base
  belongs_to :quiz
  validates_presence_of :title

  def self.subsequent_question(previous_question)
    where("id > ?", previous_question).first
  end

  def self.is_last?(question_id)
    question = Question.find(question_id)
    last_question = Question.last
    
    if question.id == last_question.id 
      return true
    else
      return false
    end
  end
end