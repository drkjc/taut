class GroupMessagesController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:create]

  def index
    @user = User.find(session[:id])
  end

  def show
  end

  def new
    @group_message = GroupMessage.new
  end

  def create
    group_message = GroupMessage.create(group_message_params)
    @user.group_messages << group_message
    @user.save

    redirect_to group_path(group_message.group)
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
