class UserSessionsController < ApplicationController
  skip_before_action :signed_in_user, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: params[:user_session][:email].downcase)
    if user && user.authenticate(params[:user_session][:password])
      sign_in_individual user
      redirect_back_or  :root
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end
end
