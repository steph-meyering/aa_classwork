class ApplicationController < ActionController::Base

  def current_user
    return nil unless session[:session_token]
    @user = User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    @user = user
    session[:session_token] = @user.reset_session_token!
  end

  def logout
    # if current_user
    @user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end




end
