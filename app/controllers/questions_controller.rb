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
end

private
def question_params
  #params.require(:question).permit(:subject_id, :source_id, :professor_id,:mini,:pdf,:sittings_attributes => {[:id, :year,:term_id, :number]} )
  params.require(:question).permit!
end