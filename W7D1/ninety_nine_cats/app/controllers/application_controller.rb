class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def require_login
    redirect_to new_session unless current_user
  end

  def prevent_new
    redirect_to cats_url if current_user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
