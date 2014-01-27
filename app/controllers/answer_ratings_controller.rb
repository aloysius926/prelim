class AnswerRatingsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    @answer_rating = @answer.answer_ratings.new(params[:answer_rating].permit(:overall, :detail, :clarity, :correctness,:comment))
    @answer_rating.user = current_user
    if current_user.id != @answer.user.id && @answer_rating.save
    	flash[:notice] = "Rating Added"
    else
    	flash[:error] = 'Adding the rating failed'
    end
    redirect_to answer_path(@answer)
  end
  def new
  end
end
