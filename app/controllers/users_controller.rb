class UsersController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit]

  def index
    @group = Group.new
    render layout: 'new_group'
  end

  def new
    @user = User.new
    render layout: 'login'
  end

  def create
    @user = User.new(user_params)
    #method in users helper
    signup_user(@user)
  end

  def show
    @contact = Contact.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

  def find_user
    @user ||= User.find(session[:user_id])
  end

end
