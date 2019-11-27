class ApplicationController < ActionController::Base

  private 

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def set_user
    if !logged_in?
      redirect_to login_path
    else
      current_user
    end
  end
end
