class UserSweeper < ActionController::Caching::Sweeper
    observe User, Sitting

  def sweep(user)
    expire_action :controller => 'users', :action => 'all'
  end

  alias_method :after_update, :sweep
  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep
end
