class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  helper_method :current_user
  helper_method :switch_user
  helper_method :switch_back


  def restrict_access
    redirect_to new_session_path, notice: "You must be logged in" unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def switch_user(user)
    current_user
    @current_user = user
    redirect_to "/profile/#{user.id}"
  end

  # def switch_back
  #   @current_user = session[:user_id]
  #   redirect_to admin_users_path
  # end

  def check_admin
    current_user
    unless @current_user && @current_user.admin?
      redirect_to new_session_path, notice: "You must be an admin to gain access"
    end
  end

end
