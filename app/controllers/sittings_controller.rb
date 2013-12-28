class SittingsController < ApplicationController
  before_filter :has_question, :only => [:new, :create]
  protected
  def has_question
    unless (@question = Question.find_by_id(params[:question_id]))
      redirect_to questions_path
    end
  end
  public
  def create
    @question.sittings << @question.sittings.build(sitting_params)
    redirect_to questions_path
  end
  def new
    @sitting = @question.sittings.build
  end
end

private
def sitting_params
  params.require(:sitting).permit!
end