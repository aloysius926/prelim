#### User Helper
module UsersHelper
  def link_to_question(yr, term, number, uid, subject)
    compare_name = "#{subject}#{yr}#{term}#{number}"
    teacher, url, link_class = '', '', ''
    i = 0
    @sittings.each do |s|
      if s.compare_print == compare_name
        if @finished.include?(s.question_id)
          teacher, url, link_class =  s.question.professor.name[0..0], question_path(s.question_id), 'finished'
          break
        else
          teacher, url, link_class =   s.question.professor.name[0..0], question_path(s.question_id), 'waiting'
          break
        end
      end
      i = i + 1
    end
    link_to(teacher, url, class: link_class)
  end
end
