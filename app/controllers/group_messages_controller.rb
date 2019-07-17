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
      group = Group.find_by(id: params[:group_id])
      group_message = GroupMessage.create(group_message_params)
      redirect_to group_path(group)
    end
  end

  def edit
    render layout: 'login'
    @group_message = GroupMessage.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def update
    group = Group.find(params[:group_id])
    group_message = GroupMessage.find(params[:id])
    if !params[:group_message][:content].empty?
      group_message.update(content: params[:group_message][:content])
      redirect_to group_path(group)
    else
      flash[:alert] = "Form can't be blank"
      redirect_to edit_group_group_message_path(group, group_message)
    end
  end

  def destroy
    group = Group.find(params[:group_id])
    group_message = GroupMessage.find(params[:id])
    group_message.delete
    redirect_to group_path(group)
  end

  ####################### END ROUTES #####################

  private

  def group_message_params
    params.require(:group_message).permit(:content, :group_id, :user_id)
  end

end
