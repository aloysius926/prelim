class QuestiontagsController < ApplicationController
  def index
    
  end
  def create
    @questiontag = Questiontag.create(params[:questiontag].permit(:tag_id,:question_id))
    @questiontag.save!
    
    redirect_to question_path(@questiontag.question)
  end
  def new
    
  end
  def show
    
  end
end
