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

  # def signup_user(user)
  #   if user.save
  #     Contact.create(username: user.username)
  #     log_in user
  #     flash[:success] = "Welcome to Taut"
  #     redirect_to users_path
  #   else
  #     flash[:errors] = user.errors.full_messages
  #     redirect_to '/users/new'
  #   end
  # end

end
