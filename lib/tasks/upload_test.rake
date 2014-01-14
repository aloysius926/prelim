require 'rake'
require 'csv'
namespace :defaultAnswer do
  task :addAnswer, [:filename] => :environment do |task,args|
    CSV.foreach("#{args.filename}", headers: true) do |row|
      row_hash = row.to_hash.stringify_keys
      if row_hash["first"] && row_hash["last"] && row_hash["name"] && row_hash["file"]
        system "pdfcut #{row_hash["file"]} #{row_hash["name"]} #{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q #{row_hash["number"]} #{row_hash["first"]} #{row_hash["last"]} >> rake.log 2>> rake.log"
      end
      
      @question =  Question.joins(:sittings, :terms, :subject).where("terms.term = '#{row_hash["term"]}' AND subjects.name = '#{row_hash["subject"]}' AND sittings.year = '#{row_hash["year"]}' AND sittings.number = '#{row_hash["number"]}'").distinct
       
      if @question.size == 1
        @answer = Answer.new(:user_id => row_hash["user_id"],:question_id => @question.first.id)
	if row_hash["professor"] && Professor.where(row.to_hash.slice(:professor))
	  @q = @question.first
	  if (@q.professor.name.nil? || @q.professor.name == "UNKNOWN") && !row_hash["professor"].nil?
	    @quest = Question.find(@q.id)
	    @quest.professor = Professor.where(row.to_hash.slice(:professor)).first 
	    @quest.save!
	  else
	    puts @q.professor.name + " " + row_hash["professor"] + " ID: " + @q.id.to_s unless @q.professor.name == row_hash["professor"]
	    puts row.to_hash.stringify_keys unless @q.professor.name == row_hash["professor"]
	  end
	end
	if row_hash["first"] && row_hash["last"] && row_hash["name"] && row_hash["file"]
          file = File.open("#{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q#{row_hash["number"]}_bo.pdf")
	else
	  file = File.open("/home/dom/Downloads/#{row_hash["year"]}#{row_hash["term"][0]}Q#{row_hash["number"]}_bo.pdf")
	end
        @answer.pdf = file
        file.close
	
	@answer.save!
      else
	puts "Non unique row"
	@question.each {|u| puts u.id}
	puts row.to_hash.stringify_keys
      end
      
    end
  end
end