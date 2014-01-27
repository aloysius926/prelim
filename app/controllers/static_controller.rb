## Catch all controller for website
class StaticController < ApplicationController
  def help
  end

  def summary
  	@professors = Professor.order(:name)
  	@finishedquestions = FinishedQuestion.user_finished(current_user.id)
  end

end
