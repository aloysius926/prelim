class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @search = Question.search(params[:q])
    @questions = @search.result()
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
    #@questions=Question.includes(:sittings, :subject, :tags, :source, :professor).all
    @current_user = current_user
  end
  def create
    @question = Question.new(question_params)
    @sitting = @question.sittings.build(params[:sitting].permit(:term_id, :year, :number))
    params[:tags][:id].each do |tag|
      if !tag.empty?
	@question.questiontags.build(:tag_id => tag)
      end
    end
    if @question.save
      redirect_to questions_path
    end
  end
  def new
    @question = Question.new
    @all_tags = Tag.all.order(:tag)
    @questiontag = @question.questiontags.build
    @question_sitting = @question.sittings.build
  end
  def show
    @question = Question.find(params[:id])
    @questiontag = Questiontag.new
    if current_user.finished_questions.where("question_id = ?", params[:id]).size > 0
      @finished_question = current_user.finished_questions.where("question_id = ?", params[:id]).first
    else
      @finished_question = FinishedQuestion.new
    end
   
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question updated"
      redirect_to :root
    else
      render 'edit'
    end
  end


end


private
def question_params
  params.require(:question).permit(:subject_id, :source_id, :professor_id,:mini,:pdf)
  #params.require(:question).permit!
end
 def sort_column
    #Question.column_names.include?(params[:sort]) ? params[:sort] : "subject_id"
                        params[:sort] || "subject_id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
