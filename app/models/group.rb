class Group < ApplicationRecord
  has_many :group_messages
  has_many :users_groups
  has_many :users, through: :users_groups

  validates :name, presence: true
end
