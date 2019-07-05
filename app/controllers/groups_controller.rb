class GroupsController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:new, :index, :show, :edit, :create]
  before_action :new_group, only: [:show]

  def index
  end

  def new
    group = Group.find(params[:group][:id])
    #method below
    join_group(group)
  end

  def create
    group = Group.find_by(name: params[:group][:name])
    #method below
    join_or_create_group(group)
  end

  def show
    @found_group = Group.find(params[:id])
    @group_message = GroupMessage.new(group_id: params[:id], user_id: @user.id )

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

  # gets conversation between users and contacts
  def group_conversation(found_group)
    @convo = GroupMessage.where(group_id: found_group.id).sort_by { |m| m.created_at}.uniq
  end

  #lets users join or create a group if it doesn't already exist or they aren't already a part of it
  def join_or_create_group(group)
    if group_params[:name].blank?
      flash[:alert] = "Group name can't be blank."
      redirect_to groups_path
    elsif group && group.user_ids != @user.id && @user.groups.empty?
      @user.groups << group
      redirect_to group_path(@user.groups.first)
    elsif group && group.user_ids != @user.id
      flash[:notice] = "That group name is already taken. Please pick another."
      redirect_to group_path(@user.groups.first)
    elsif @user.groups.include?(group)
      redirect_to group_path(group)
    else
      @user.groups << Group.create(group_params)
      @user.save
      redirect_to group_path(@user.groups.last)
    end
  end

  #let's users join a group if they aren't already a part of it
  def join_group(group)
    if @user.groups.include?(group)
      redirect_to group_path(group)
    else
      @user.groups << group
      @user.save
      redirect_to group_path(group)
    end
  end


end
