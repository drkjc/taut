class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
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

  def destroy
    log_out
    redirect_to root_path
  end
end
