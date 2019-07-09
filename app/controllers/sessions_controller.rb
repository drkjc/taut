class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    #method in application controller
    log_in_user_with_omniauth
  end


  def destroy
    # method in application_controller
    log_out
    redirect_to root_path
  end

  ####################### END ROUTES #####################

  def auth
    request.env['omniauth.auth']
  end

end
