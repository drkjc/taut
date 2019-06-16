class UsersController < ApplicationController
  layout "login"

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create

    @user = User.find_or_create_by(user_params)

    if @user
      session[:id] = @user.id
      redirect_to '/home'
    else
      redirect_to :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password_digest)
  end

end
