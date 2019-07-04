module UsersHelper

  def signup_user(user)
    if user.save
      Contact.create(username: user.username)
      log_in user
      flash[:success] = "Welcome to Taut"
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    end
  end

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
