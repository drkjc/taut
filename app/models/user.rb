class User < ApplicationRecord
  has_many :messages
  has_many :group_messages
  has_many :contacts, through: :messages
  has_many :users_groups
  has_many :groups, through: :users_groups
end
