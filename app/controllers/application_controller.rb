class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include MessagesHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    if current_user.nil?
      redirect_to root_path
    end
  end

  def find_user
    @user ||= User.find(session[:user_id])
  end


end
