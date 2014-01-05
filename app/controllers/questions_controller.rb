class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @questions=Question.includes(:sittings).all
    @questions.sort_by! {|u| if u.send(sort_column)
                           u.send(sort_column).to_s
                        else
                          ""
                        end
                         }
    @questions.reverse! if sort_direction == "desc"
    @current_user = current_user
  end
  def create
    @question = Question.new(question_params)
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
    @question_tag = @question.questiontags.build
  end
  def show
    @question = Question.find(params[:id])
    if current_user.finished_questions.where("question_id = ?", params[:id]).size > 0
      @finished_question = current_user.finished_questions.where("question_id = ?", params[:id]).first
    else
      @finished_question = FinishedQuestion.new
    end
   # @finished_question =FinishedQuestion.first
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
