require 'rake'
require 'csv'
namespace :defaultAnswer do
  task :addAnswer, [:filename] => :environment do |task,args|
  i=0
    CSV.foreach("#{args.filename}", headers: true) do |row|
      i=i+1
      row_hash = row.to_hash.stringify_keys
      ## Column contains an upload tag which is "n" if it shouldn't be uploaded
      if row_hash["upload"].nil?
        ### First create the pdf
        if row_hash["first"] && row_hash["last"] && row_hash["name"] && row_hash["file"]
          system "pdfcut #{row_hash["file"]} #{row_hash["name"]} #{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q #{row_hash["number"]} #{row_hash["first"]} #{row_hash["last"]} >> rake.log 2>> rake.log"
        end
        ### Find the correct question. And check where the number of matching questions is 1.
        @question =  Question.joins(:sittings, :terms, :subject).where("terms.term = '#{row_hash["term"]}' AND subjects.name = '#{row_hash["subject"]}' AND sittings.year = '#{row_hash["year"]}' AND sittings.number = '#{row_hash["number"]}'").distinct
        if @question.size == 1
          ### I want to create a new answer, but I need to handle the reference data separately
          @answer = Answer.new(:user_id => row_hash["user_id"],:question_id => @question.first.id)
          if row_hash["professor"] &&  Professor.where("name = ?",row_hash["professor"]).size == 1
            ## Question size is 1 so first will just convert the array to an element
            @q = @question.first
            @quest = Question.find(@q.id)
            puts @q
            ## I'm also updating professors because sometimes the answers have best guesses at professors
            if (@q.professor.name.nil? || @q.professor.name == "UNKNOWN") && !row_hash["professor"].nil?
              # @q is read only so I have to grab a copy I can write to
              @quest.professor = Professor.where("name = ?",row_hash["professor"]).first
              @quest.save!
            else
              ## Print debugging info if the professor in the db doesn't match the professor from the spreadsheet
              puts @q.professor.name + " " + row_hash["professor"] + " ID: " + @q.id.to_s unless @q.professor.name == row_hash["professor"]
              puts row.to_hash.stringify_keys unless @q.professor.name == row_hash["professor"]
            end
          end
          ## Attach the correct file
          if row_hash["first"] && row_hash["last"] && row_hash["name"] && row_hash["file"]
            file = File.open("#{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q#{row_hash["number"]}_#{row_hash["name"]}.pdf")
          end
          @answer.pdf = file
          file.close
          ### Add the correct tags
          if !row_hash["tags"].nil?
            tags = row_hash["tags"].split(';')
            tags.each do |tag|
              if Tag.where("lower(tag) = ?",tag.downcase).size>0
                @tag = Tag.where("lower(tag) = ?",tag.downcase).first
              else
                @tag = Tag.create(:tag => tag.capitalize)
              end
              @questiontag = Questiontag.new
              @questiontag.question_id = @quest.id
              @questiontag.tag_id = @tag.id
              @questiontag.save!
              @quest.save!
            end
          end
          ## Mark whether answer is handwritten
          if row_hash["handwritten"].nil?
            @answer.typed = true
          end
          @answer.save!
        else
          ### Printing debugging information if there are multiple question matches
          puts "Non unique row"
          @question.each {|u| puts u.id}
            puts row.to_hash.stringify_keys
        end
      else
        ##### Fix Professor if upload tag is not nil
        @question =  Question.joins(:sittings, :terms, :subject).where("terms.term = '#{row_hash["term"]}' AND subjects.name = '#{row_hash["subject"]}' AND sittings.year = '#{row_hash["year"]}' AND sittings.number = '#{row_hash["number"]}'").distinct
        if @question.size == 1
          @q = @question.first
	  @quest = Question.find(@q.id)
          puts @q
          ## I'm also updating professors because sometimes the answers have best guesses at professors
          if (@q.professor.nil? || @q.professor.name == "UNKNOWN") && !row_hash["professor"].nil?
            # @q is read only so I have to grab a copy I can write to
            @quest.professor = Professor.where("name = ?",row_hash["professor"]).first
            @quest.save!
          else
            ## Print debugging info if the professor in the db doesn't match the professor from the spreadsheet
            begin
	      puts @q.professor.name + " " + row_hash["professor"] + " ID: " + @q.id.to_s unless @q.professor.name == row_hash["professor"]
              puts row.to_hash.stringify_keys unless @q.professor.name == row_hash["professor"]
	    rescue
	    end
          end
        end
      end
    end
  end
  task :cutPDFS, [:filename] => :environment do |task,args|
    CSV.foreach("#{args.filename}", headers: true) do |row|
      row_hash = row.to_hash.stringify_keys
      system "pdfcut #{row_hash["file"]} #{row_hash["name"]} #{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q #{row_hash["number"]} #{row_hash["first"]} #{row_hash["last"]} >> rake.log 2>> rake.log"
    end
  end
  task :cutQuest, [:filename] => :environment do |task,args|
    CSV.foreach("#{args.filename}", headers: true) do |row|
      row_hash = row.to_hash.stringify_keys
      system "pdfcut_q #{row_hash["file"]} #{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q #{row_hash["number"]} #{row_hash["first"]} #{row_hash["last"]} >> rake.log 2>> rake.log"
    end
  end
end
