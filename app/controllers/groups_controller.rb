class GroupsController < ApplicationController
  before_action :find_user, only: [:show, :edit, :create]

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.find_by(name: params[:group][:name])
    if !group
      @user.groups << Group.create(group_params)
      redirect_to group_path(@user.groups.last)
    else
      flash[:notice] = "Group already exists"
      redirect_to @user
    end
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
    @user = User.find(session[:user_id])
  end

end
