class ApplicationController < ActionController::Base

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
      redirect_to group_path(user.groups.first)
    elsif user && !user.authenticate(params[:session][:password])
      flash[:notice] = 'Invalid password'
      redirect_to root_path
    else
      flash[:notice] = "Can't find user. Create an account!"
      redirect_to new_user_path
    end
  end

  def logged_in?
    if find_user.nil?
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
