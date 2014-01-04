class FinishedQuestionsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @finished_question = @question.finished_questions.create(params[:finished_question].permit(:finished))
    @finished_question.user = current_user
    @finished_question.save!
    redirect_to question_path(@question)
  end
  def new
  end
end
