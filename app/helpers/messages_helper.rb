module MessagesHelper

  def get_message
    Message.find(params[:id])
  end

  def get_contact
    Contact.find(params[:contact_id])
  end

  # def format_convo(contact, user)
  #    unless @convo.empty?
  #      @convo.each do |m|
  #        if m.user_id == @user.id
  #          m.content (button_to 'x', contact_message_path(@contact, m), params: { 'contact_id' => @contact.id }, method: :delete,  data: {confirm: 'Confirm Delete'}), (button_to 'o', edit_contact_message_path(@contact, m), method: :get,  data: {confirm: 'Edit Message?'})
  #        else
  #          m.content
  #        end
  #      end
  #    end
  # end

end
