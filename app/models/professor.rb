class Professor < ActiveRecord::Base
	has_many :questions
end
