class UsersController < ApplicationController

  def new
    @user = User.new
    render layout: 'login'
  end

  def create
    binding.pry
    @user = User.new(user_params)
    binding.pry
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Taut"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(session[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

end
