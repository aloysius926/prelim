require 'rake'

namespace :cleanDatabase do
  task :fixAllen => :environment do
    @questions = Question.joins(:subject, :professor).where("subjects.name = 'Macro' AND professors.name = 'Allen'")
    @questions.each do |q|
      ### 17 is "UNKNOWN"
      quest = Question.find(q.id)
      quest.professor = Professor.find(17)
      quest.save!
    end
  end

  task :uploadProfessors do
  end

  task :findDuplicateFiles => :environment do
    while findDups
    end

  end

  def findDups
    @answers = Answer.all
    @answers.each do |a|
      @answers.each do |b|
        if !(a.id==b.id) && (a.identical? b )
	  puts a.id.to_s + a.pdf_file_name + " " + b.id.to_s + b.pdf_file_name
	  puts Answer.find(b.id).destroy if (a.identical? b )
	  return true
        end
      end
    end
    return false
  end

  task :checkAnswerSubject => :environment do
    @answers = Answer.joins(:question)
    @answers.each do |a|
      puts a.question.subject.name + " " + a.pdf_file_name unless a.pdf_file_name.include? a.question.subject.name.downcase
    end
  end
  task :checkQuestionSubject => :environment do
    @questions = Question.joins(:subject)
    @questions.each do |q|
      unless q.pdf_file_name.include? q.subject.name.downcase
        @quest = q.id
        @quest.subject = Subject.where("name=?",q.pdf_file_name[0,5].capitalize ).first if Subject.where("name=?",q.pdf_file_name[0,5].capitalize ).size == 1
        @quest.save!
      end
    end
  end
end
