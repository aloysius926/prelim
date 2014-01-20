module UsersHelper
  def link_to_question(yr,term,number,uid,subject)
    term_id = Term.where("term = :term", term: term).first.id
    
    @sittings = Sitting.where("year=:yr AND term_id=:term AND number=:number",yr: yr,term: term_id,number: number)
    teacher,url,link_class = '','',''
    @sittings.each do |s|
      if s.question.subject.id == subject   
        if @finished.include?(s.question.id)
          teacher,url,link_class =  s.question.professor.name[0..0],question_path(s.question.id),'finished'
	else
	  teacher,url,link_class=   s.question.professor.name[0..0],question_path(s.question.id),'waiting'
        end
      end
    end
    link_to(teacher,url,class: link_class)
  end
end   