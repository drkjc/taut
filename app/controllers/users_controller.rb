class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]
  before_action :find_user, only: [:index, :show]

  def index
    @group = Group.new
    render layout: 'login'
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
    @group = Group.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

end
