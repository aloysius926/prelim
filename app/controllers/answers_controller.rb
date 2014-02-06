# Let users see and add answers
class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
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

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(answer.question.id)
    if @answer.update_attributes(answer_params)
      flash[:success] = "Answer Updated"
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end
end

private
def answer_params
  params.require(:answer).premit(:pdf, :typed)
end
