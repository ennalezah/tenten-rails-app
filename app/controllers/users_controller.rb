class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sessions[:user_id] = @user.id 
      redirect_to 
    else
    end
  end

  def show
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
