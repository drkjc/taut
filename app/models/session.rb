class Session < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Logs out the given user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
