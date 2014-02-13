# Let users see and add answers
class AnswersController < ApplicationController
  before_filter :find_answer, only: [:show, :edit, :update]
  before_filter :find_question, only: [:create, :update]

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def create
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
  end

  def edit
  end

  def update
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
