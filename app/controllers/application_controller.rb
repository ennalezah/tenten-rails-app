class ApplicationController < ActionController::Base

  private 

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def redirect_to_login
    if !logged_in? || current_user.blank?
      redirect_to dashboard_path
    end
  end
end
