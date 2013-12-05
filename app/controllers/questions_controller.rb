class QuestionsController < ApplicationController
  def index
    @questions=Question.all
  end
  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end
  def new
  end
end

private
def question_params
  params.require(:question).permit(:subject_id, :source_id, :year,:professor_id,:number,:term_id,:mini,:pdf)
end