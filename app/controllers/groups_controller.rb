class GroupsController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit, :create]

  def index
    @user = User.find(session[:id])
  end

  def show
    @group = Group.find(params[:id])
    #render template: "groups/index"
  end

  def new
    @group = Group.new
  end

  def create
    @user.groups << Group.create(group_params)
    binding.pry
    redirect_to groups_path
  end

  def edit
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_user
    @user = User.find(session[:id])
  end

end
