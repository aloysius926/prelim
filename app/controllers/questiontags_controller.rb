class QuestiontagsController < ApplicationController
  def index
    
  end
  def create
    @questiontag = @question.questiontags.create(params[:questiontag].permit(:tag,:question_id))
    @questiontag.save!
    
    redirect_to question_path(@questiontag.question)
  end
  def new
    
  end
  def show
    
  end
end
