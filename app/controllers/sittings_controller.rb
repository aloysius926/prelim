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
  def edit
    @sitting = Sitting.find(params[:id])
    @question = Question.find(params[:question_id])
  end
  def update
    @sitting = Sitting.find(params[:id])
    @question = Question.find(params[:question_id])
    if @sitting.update_attributes(sitting_params)
       flash[:success] = "Sitting updated"
      redirect_to :root
    else
      render 'edit'
    end
  end
end

private
def sitting_params
  params.require(:sitting).permit!
end
