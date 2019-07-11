class Message < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  def contacts_attributes=(contact_attributes)
    contact_attributes
    binding.pry
  end
end
