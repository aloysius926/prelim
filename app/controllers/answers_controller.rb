class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer].permit(:pdf))
    @answer.user_id = current_user.id
    @answer.save!
    redirect_to question_path(@question)
  end
  def show
    @answer = Answer.find(params[:id])
  end
                              
end
