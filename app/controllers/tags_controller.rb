class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  def create
    @tag = Tag.create!(params[:tag].permit(:tag))
    redirect_to questions_path
  end
  
end
