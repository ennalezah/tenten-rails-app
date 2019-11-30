class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index 
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id 
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
