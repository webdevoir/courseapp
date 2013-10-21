class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @chapter = Chapter.find(@quiz.chapter_id)
    @course = Course.find(@chapter.course_id)
    if params[:question_id].present?
      @question = Question.find(params[:question_id])
    else
      @question = @quiz.questions.first  
    end

    if params[:next]
      @question = Question.subsequent_question(@question)
    end
  end

  def complete
    @quiz = Quiz.find(params[:id])
    @chapter = Chapter.find(@quiz.chapter_id)
    @course = Course.find(@chapter.course_id)
  end
end