# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Micro","Macro"].each { |x| Subject.create(:name => x)}
["Prelim","Midterm","Final"].each { |x| Source.create(:source => x)}
["Allen","Chari","Chung","Hurwicz","Jones","Kehoe, P","Kehoe, T","Kocherlakota","McLennan","Obara","Perri","Prescott","Richter","Rios-Rull","Rustichini","Werner" ].each {|x| Professor.create(:name => x)}
["Ramsey","Search","Utility"].each {|x| Tag.create(:tag => x)}
["Fall","Spring"].each {|x| Term.create(:term => x)}
User.create(name: "Dominic Smith", email: "smit6226@umn.edu", password: "saasbook", password_confirmation: "saasbook")
