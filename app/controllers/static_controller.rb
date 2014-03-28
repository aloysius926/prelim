## Catch all controller for website
class StaticController < ApplicationController
  def help
  end

  def summary
    @professors = Professor.order(:name)
    @finishedquestions = FinishedQuestion.user_finished(current_user.id)
    professors = Professor.where("name in ('Allen','Werner','Rustichini','Kehoe, T','Jones','Chari','Rios-Rull')").pluck(:id)
    @micro_questions = Question.joins(:subject).where(:professor_id => professors).where("subjects.name = 'Micro'")
    @micro_complete = @micro_questions.joins(:finished_questions).where("finished_questions.user_id = #{current_user.id} and
    	                                                                 finished = TRUE").size
    @micro_total_min = @micro_questions.size
    @micro_total_max = @micro_total_min + Question.joins(:subject,:professor).where("subjects.name = 'Micro' and professors.name = 'UNKNOWN'").size
    @micro_to_exam = (Date.new(2014, 5, 21) - Date.today).to_i
    @micro_per_day = @micro_total_min.to_i * 1.0 / @micro_to_exam.to_i

    # I really need to learn metaprogramming in rails
    @macro_questions = Question.joins(:subject).where(:professor_id => professors).where("subjects.name = 'Macro'")
    @macro_complete = @macro_questions.joins(:finished_questions).where("finished_questions.user_id = #{current_user.id} and
    	                                                                 finished = TRUE").size
    @macro_total_min = @macro_questions.size
    @macro_total_max = @macro_total_min + Question.joins(:subject,:professor).where("subjects.name = 'Macro' and professors.name = 'UNKNOWN'").size
    @macro_to_exam = (Date.new(2014, 5, 28) - Date.today).to_i
    @macro_per_day = @macro_total_min.to_i * 1.0 / @macro_to_exam.to_i


  end

  def teacher
  end
end
