class GroupMessagesController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:index, :create, :show]

  def index
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group_message = GroupMessage.new
  end

  def create
    if params[:group_id]
      group = Group.find(params[:group_id])
      group_message = GroupMessage.new(group_message_params)
      group_message.group = group
      group_message.user = @user
      group_message.save
      redirect_to group_path(group_message.group)
    else
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def destroy
  end

  private

  def group_message_params
    params.require(:group_message).permit(:content,
      :group_id)
  end

end
