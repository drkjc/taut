class User < ApplicationRecord
  has_many :messages
  has_many :group_messages
  has_many :contacts, through: :messages
  has_many :users_groups
  has_many :groups, through: :users_groups

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

end
