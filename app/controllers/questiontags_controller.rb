class QuestiontagsController < ApplicationController
  def create
    @questiontag = Questiontag.create!(params[:questiontag].permit(:tag_id,:question_id))
    redirect_to question_path(@questiontag.question)
  end
end