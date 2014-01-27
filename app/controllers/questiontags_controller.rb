## Handles the question tag join table
class QuestiontagsController < ApplicationController
  def create
    @questiontag = Questiontag.new(questiontag_params)
    if @questiontag.save
      flash[:notice] = 'Tag Successfully Added'
      redirect_to question_path(@questiontag.question)
    else
      flash[:error] = 'Adding the tag failed. Probably because it is a duplicate'
      redirect_to question_path(@questiontag.question)
    end
  end

  private

  def questiontag_params
    params[:questiontag].permit(:tag_id, :question_id)
  end
end
