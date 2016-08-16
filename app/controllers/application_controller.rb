class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def restrict_access
    redirect_to new_session_path, notice: "You must be logged in" unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
