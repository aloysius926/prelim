class QuestionsController < ApplicationController
  def index
    @questions=Question.includes(:sittings).all
  end
  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end
  def new
    @question = Question.new
    @question.sittings.build
  end
end

private
def question_params
  params.require(:question).permit(:subject_id, :source_id, :professor_id,:mini,:pdf,:sittings_attributes => [:id, :year,:term_id, :number] )
end