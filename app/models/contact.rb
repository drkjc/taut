class Contact < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  accepts_nested_attributes_for :messages
end
