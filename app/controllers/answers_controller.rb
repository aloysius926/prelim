# Let users see and add answers
class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer].permit(:pdf))
    @answer.user_id = current_user.id
    if @answer.save
      flash[:notice] = 'Your answer has been uploaded.  Thanks a lot'
      redirect_to question_path(@question)
    else
      flash[:error] = 'Something went wrong and your answer was not added.'
      redirect_to question_path(@question)
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end
end
