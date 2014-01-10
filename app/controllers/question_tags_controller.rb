class QuestionTagsController < ApplicationController
  def index
    
  end
  def create
    @question_tag = @question.question_tags.create(params[:question_tag].permit(:tag,:question_id))
    @question_tag.save!
    
    redirect_to question_path(@question_tag.question)
  end
  def new
    
  end
  def show
    
  end
end
