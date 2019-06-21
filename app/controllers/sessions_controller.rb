class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    binding.pry
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to new_user_path
    end
  end

  def destroy
    log_out
    redirect_to '/login'
  end
end
