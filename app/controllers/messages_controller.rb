class MessagesController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:index, :create]


  def index
  end

  def new
  end

  def create
    if params[:contact_id]
      contact = Contact.find(params[:contact_id])
      message = Message.new(message_params)
      message.contact = contact
      message.user = @user
      message.save
      redirect_to contact_path(message.contact)
    else
      redirect_to user_path(@user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
