class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # method below
    redirect_user(user)
  end

  def destroy
    # method below
    log_out
    redirect_to root_path
  end

  ####################### END ROUTES #####################

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the given user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Redirects user to home page or shows login errors
  def redirect_user(user)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    elsif user && !user.authenticate(params[:session][:password])
      flash[:notice] = 'Invalid password'
      redirect_to root_path
    else
      flash[:notice] = "Can't find user. Create an account!"
      redirect_to new_user_path
    end
  end
end
