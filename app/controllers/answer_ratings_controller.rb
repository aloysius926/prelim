class AnswerRatingsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    @answer_rating = @answer.answer_ratings.create(params[:answer_rating].permit(:overall, :detail, :clarity, :correctness))
    @answer_rating.user = current_user
    @answer_rating.save!
    redirect_to answer_path(@answer)
  end
  def new
  end
end
