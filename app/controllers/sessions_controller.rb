class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # method in application_controller
    redirect_user(user)
  end

  def destroy
    # method in application_controller
    log_out
    redirect_to root_path
  end

  ####################### END ROUTES #####################

end
