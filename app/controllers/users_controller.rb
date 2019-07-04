class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]
  before_action :find_user, only: [:index, :show]
  before_action :new_group, only: [:index, :show]

  def index
    render layout: 'login'
  end

  def new
    @user = User.new
    render layout: 'login'
  end

  def create
    @user = User.new(user_params)
    #method below
    signup_user(@user)
  end

  def show
  end

  ####################### END ROUTES #####################

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

  def signup_user(user)
    if user.save
      Contact.create(username: user.username)
      log_in user
      flash[:success] = "Welcome to Taut"
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    end
  end

end
