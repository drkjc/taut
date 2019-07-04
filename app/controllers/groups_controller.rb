class GroupsController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:new, :index, :show, :edit, :create]

  def index
    @group = Group.find(params[:group][:id])
    if @user.groups.include?(@group)
      redirect_to group_path(@group)
    else
      @user.groups << @group
      redirect_to group_path(@group)
    end
  end

  def show
    @group = Group.new
    @found_group = Group.find(params[:id])
  end

  def new
  end

  def create
    group = Group.find_by(name: params[:group][:name])
    if group
      @user.groups << group unless @user.groups.include?(group)
      @user.save
      redirect_to group_path(@user.groups.last)
    elsif group_params[:name].blank?
      binding.pry
      flash[:alert] = "Group name can't be blank."
      redirect_to groups_path
    else
      @user.groups << Group.create(group_params)
      redirect_to group_path(@user.groups.last)
    end
  end

  def show
    @group = Group.new
    @found_group = Group.find(params[:id])
    @group_message = GroupMessage.new
    messages = []

    messages << GroupMessage.where(group_id: @found_group.id)
    @conversation = messages.flatten.sort_by { |m| m.created_at}.uniq
  end

  def edit
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
