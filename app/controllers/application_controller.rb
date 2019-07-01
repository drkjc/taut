class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
