class FinishedQuestionsController < ApplicationController
  def create
    @finished_question = FinishedQuestion.new(params[:finished_question].permit(:question_id, :finished))
    @finished_question.user = current_user
    @question = @finished_question.question
    @finished_question.save!
    redirect_to question_path(@question)
  end
  def new
  end
  def update
    
    @finished_question = FinishedQuestion.find(params[:id])
    @question = @finished_question.question
    @finished_question.update_attributes(params[:finished_question].permit(:finished))
    redirect_to question_path(@question)
  end
end
