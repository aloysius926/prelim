class QuestiontagsController < ApplicationController
  def create
    @questiontag = Questiontag.new(params[:questiontag].permit(:tag_id,:question_id))
    if @questiontag.save
      flash[:notice] = 'Tag Successfully Added'
      redirect_to question_path(@questiontag.question)
    else
      flash[:error] = 'Adding the tag failed. Probably because it is a duplicate'
      redirect_to question_path(@questiontag.question)
    end
  end
end
