class Message < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :content, presence: true
end
