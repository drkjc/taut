class UsersController < ApplicationController

  def new
    @user = User.new
    render layout: 'login'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Taut"
      redirect_to user_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

end
