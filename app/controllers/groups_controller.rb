class GroupsController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit]

  def index
    @user = User.find(session[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(session[:id])
  end

end
