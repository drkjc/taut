module UsersHelper

  def show_contacts
    if !get_contacts.include?(@user)
      get_contacts << @user
      get_contacts.map do |contact|
        User.find_by(username: contact)
      end
    end
  end

  def get_contacts
    get_sent_message_contact | get_received_message_user
  end

  def get_received_message_user
    Message.where(contact_id: @user.id).map do |message|
      message.user.username
    end.uniq
  end

  def get_sent_message_contact
    Message.where(user_id: @user.id).map do |message|
      message.contact.username
    end.uniq
  end

end
