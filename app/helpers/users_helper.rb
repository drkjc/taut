module UsersHelper

  def get_contacts
    get_sent_message_contact | get_received_message_user
  end

  def get_received_message_user
    Message.where(contact_id: @user.id).map do |message|
      message.user
    end
  end

  def get_sent_message_contact
    Message.where(user_id: @user.id).map do |message|
      message.contact
    end
  end

end
