class Message < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  def self.sent_messages(user, contact)
    where(user_id: user.id, contact_id: contact.id)
  end

  def self.received_messages(contact, user)
    where(user_id: contact.id, contact_id: user.id)
  end

end
