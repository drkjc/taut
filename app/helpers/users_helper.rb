module UsersHelper

  # def show_contacts
  #   #[<# User id: 1, username: derek]
  #   if !get_contacts.include?(@user.username)
  #     # @user = "kelley"
  #     #["derek", "lana"]
  #     get_contacts << @user.username
  #     #["derek", "lana", "kelley"]
  #     get_contacts.map do |contact|
  #       Contact.find_by(username: contact)
  #     end
  #   end
  # end
  #
  # def get_contacts
  #   get_sent_message_contact | get_received_message_user
  #   # ["derek", "lana", "kelley"]
  # end
  #
  # def get_received_message_user
  #   Message.where(contact_id: @user.id).map do |message|
  #     message.user.username
  #   end.uniq
  #   # returns an arry of messages where contact_id == @user.id
  #   # ["derek", "lana"] @user.
  # end
  #
  # def get_sent_message_contact
  #   Message.where(user_id: @user.id).map do |message|
  #     message.contact.username
  #   end.uniq
  #   #returns an array of sent messages with @user.id
  #   # ["kelley"]
  # end

end
