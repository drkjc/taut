class MessagesController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:index, :create]

  def index
  end

  def new
  end

  def create
    if params[:contact_id]
      contact = Contact.find_by(id: params[:contact_id])
      message = Message.create(message_params)
      redirect_to contact_path(contact)
    end
  end



  private

  def message_params
    params.require(:message).permit(:content, :contact_id, :user_id)
  end
end
