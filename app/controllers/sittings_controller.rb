class SittingsController < ApplicationController
  before_filter :has_question, :only => [:new, :create]
  before_filter :find_sitting_and_question, :only => [:edit, :update]

  protected
  def has_question
    unless (@question = Question.find_by_id(params[:question_id]))
      redirect_to questions_path
    end
  end

  public
  def find_sitting_and_question
    @sitting = Setting.find(params[:id])
    @question = Question.find(params[:id])
  end

  def create
    @question.sittings << @question.sittings.build(sitting_params)
    redirect_to questions_path
  end

  def new
    @sitting = @question.sittings.build
  end

  def edit
  end

  def update
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
