class MessagesController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit, :create]

  def index
  end

  def new
  end

  def create
    contact = Contact.find(params[:contact_id])
    message = Message.create(message_params)
    @user.messages << message
    @user.save
    binding.pry
    redirect_to user_contact_path(message.contact)
  end

  private

  def message_params
    params.require(:message).permit(:content, :contact_id)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
