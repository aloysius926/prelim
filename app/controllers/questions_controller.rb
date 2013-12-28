class QuestionsController < ApplicationController
  def index
    @questions=Question.includes(:sittings).all
  end
  def create
    Question.create(question_params)
    redirect_to questions_path
  end
  def new
    @question = Question.new
  end
  def show
    @question = Question.find(params[:id])
  end
end

private
def question_params
  params.require(:question).permit(:subject_id, :source_id, :professor_id,:mini,:pdf)
  #params.require(:question).permit!
end