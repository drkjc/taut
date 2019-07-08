module MessagesHelper

  def get_message
    Message.find(params[:id])
  end

  def get_contact
    Contact.find(params[:contact_id])
  end

end
