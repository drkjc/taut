class GroupsController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:new, :index, :show, :edit, :create]
  before_action :new_group, only: [:show]

  def index
    group = Group.find(params[:group][:id])
    #method below
    join_group(group)
  end

  def new
  end

  def create
    group = Group.find_by(name: params[:group][:name])
    #method below
    join_or_create_group(group)
  end

  def show
    @found_group = Group.find(params[:id])
    @group_message = GroupMessage.new
    #method below
    group_conversation(@found_group)
  end

  def edit
  end

  def destroy
  end

  ####################### END ROUTES #####################

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def group_conversation(found_group)
    @convo = GroupMessage.where(group_id: found_group.id).sort_by { |m| m.created_at}.uniq
  end

  def join_or_create_group(group)
    if group
      @user.groups << group unless @user.groups.include?(group)
      @user.save
      redirect_to group_path(@user.groups.last)
    elsif group_params[:name].blank?
      flash[:alert] = "Group name can't be blank."
      redirect_to groups_path
    else
      @user.groups << Group.create(group_params)
      redirect_to group_path(@user.groups.last)
    end
  end

  def join_group(group)
    if @user.groups.include?(@group)
      redirect_to group_path(@group)
    else
      @user.groups << @group
      redirect_to group_path(@group)
    end
  end


end
