require 'rake'
require 'csv'
namespace :defaultQuestion do
  task :addQuestion, [:filename] => :environment do |task,args|
    CSV.foreach("#{args.filename}", headers: true) do |row|
      row_hash = row.to_hash.stringify_keys
      if row_hash["first"] && row_hash["last"] && row_hash["file"]
        system "pdfcut_q #{row_hash["file"]} #{row_hash["stub"]}#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q #{row_hash["number"]} #{row_hash["first"]} #{row_hash["last"]} >> rake.log 2>> rake.log"
      end
      
      @question =  Question.new()
      #
      @question.source = Source.first
     
      ## Subject
      if row_hash["subject"]  && Subject.where("name = ?",row_hash["subject"]).size == 1
	@question.subject = Subject.where(row.to_hash.slice(:subject)).first
      end
      ## Professor
      if row_hash["professor"] && Professor.where(row.to_hash.slice(:professor)).size == 1
	@question.professor = Professor.where(row.to_hash.slice(:professor)).first
      end
      ## Sitting
      @term = Term.where(row.to_hash.slice(:term)).first
      @sitting = Sitting.new()
      @sitting.year = row_hash["year"]
      @sitting.number = row_hash["number"]
      @sitting.term = @term
      puts @sitting.print_sitting
      @question.sittings << @sitting
                                          
      ## PDF
    
      file = File.open("/home/dom/Downloads/#{row_hash["subject"].downcase}_#{row_hash["year"]}#{row_hash["term"][0]}Q#{row_hash["number"]}.pdf")
    
      @question.pdf = file
    
      file.close
     @question.save!
      @sitting.save!
    
    
    end 
  end
end