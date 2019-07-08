module GroupMessagesHelper

  def get_group_message
    GroupMessage.find(params[:id])
  end

  def get_group
    Group.find(params[:group_id])
  end

end
