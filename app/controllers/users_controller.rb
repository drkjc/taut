class UsersController < ApplicationController

  def index
    @user = User.new
    render template: "login"
  end

  def new
    @user = User.new
    render template: "login"
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

  def show
    @user = User.find(session[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password_digest)
  end

end
