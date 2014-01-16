module UsersHelper
  def link_to_question(yr,term,number,uid,subject)
    term_id = Term.where("term = :term", term: term).first.id
    @finished = FinishedQuestion.where("user_id = :user",user: uid).pluck(:question_id)
    @sittings = Sitting.where("year=:yr AND term_id=:term AND number=:number",yr: yr,term: term_id,number: number)
    teacher,url = '',''
    @sittings.each do |s|
      if s.question.subject.id == subject   
        if @finished.include?(s.question.id)
          teacher,url =  'X','#'
	else
	  teacher,url=   s.question.professor.name[0..0],question_path(s.question.id)
        end
      end
    end
    link_to(teacher,url)
  end
end   