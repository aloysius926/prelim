class QuestionsController < ApplicationController
  def index
    sort = params[:sort] || session[:sort]
    @questions=Question.includes(:sittings).all
    
    case sort
    when 'subject'
      ordering, @subject_header = {:order => :subject}, 'hilite'
      @questions.sort_by! {|u| u.subject.name}
    when 'overall'
      ordering, @overall_header = {:order => :overall}, 'hilite'
      @questions.sort_by! {|u| u.overall.to_s}
      @questions.reverse!
    when 'finished'
      ordering, @finished_header = {:order => :finished}, 'hilite'
      @questions.sort_by! {|u| u.finished?(current_user).to_s}
    when 'date'
      @questions.sort_by! {|u| 
                           if u.sittings.first
                             u.sittings.first.sort_sitting
                          else
                            ""
                          end}
      @questions.reverse!
    end
    if params[:sort] != session[:sort]
      session[:sort] = sort
      flash.keep
      redirect_to :sort => sort and return
    end

    
  end
  def create
    Question.create(question_params)
    redirect_to questions_path
  end
  def new
    @question = Question.new
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