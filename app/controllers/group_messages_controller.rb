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
  end

  def destroy
  end

  ####################### END ROUTES #####################

  private

  def group_message_params
    params.require(:group_message).permit(:content,
      :group_id, :user_id)
  end

end
