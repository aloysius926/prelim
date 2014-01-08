class LoadRatings < ActiveRecord::Migration
   def self.up
    ratings = ['Well Below Average','Slightly Below Average','Average','Slightly Above Average','Well Above Average']
    i=1
    for rating in ratings
        RatingOption.create(:value=>i,:label=>rating)
	i=i+1
    end
  end

  def self.down
    RatingOption.delete_all
  end
end
