### User Model
class UsersController < ApplicationController
  skip_before_action :signed_in_user, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :show]
  before_filter :find_user, only: [:edit, :update, :correct, :show_user]
  #caches_action :index, :show
  #cache_sweeper :user_sweeper

  def find_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_individual @user
      flash[:success] = 'You have successfully registered'
      redirect_to :root
    else
      render action: :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to :root
    else
      render 'edit'
    end
  end

  def show
    @subjects = Subject.all
    @finished = FinishedQuestion.user_finished(current_user.id)
    @sittings = Sitting.table_sittings
    @table = params[:table] || 'macro'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
