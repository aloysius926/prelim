class QuestionRatingsController < ApplicationController
  def index
    
  end
  def create
    @question = Question.find(params[:question_id])
    @question_rating = @question.question_ratings.create(params[:question_rating].permit(:overall, :uniqueness, :difficulty, :comment))
    redirect_to question_path(@question)
  end
  def new
    
  end
  def show
    
  end
end
