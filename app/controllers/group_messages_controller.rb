class GroupMessagesController < ApplicationController

  def index
    @user = User.find(session[:id])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
