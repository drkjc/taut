class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include MessagesHelper

  def logged_in?
    if current_user.nil?
      redirect_to root_path
    end
  end

  def find_user
    @user ||= User.find(session[:user_id])
  end

  def new_group
    @group = Group.new
  end


end
