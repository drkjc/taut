class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # method in sessions helper
    redirect_user(user)
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
