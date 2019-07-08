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

  def edit
    render layout: 'login'
    @message = Message.find(params[:id])
    @contact = Contact.find(params[:contact_id])
  end

  def update
    contact = Contact.find(params[:contact_id])
    message = Message.find(params[:id])
    if !params[:message][:content].empty?
      message.update(content: params[:message][:content])
      redirect_to contact_path(contact)
    else
      flash[:alert] = "Form can't be blank"
      redirect_to edit_contact_message_path(contact, message)
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.delete
    redirect_to contact_path(params[:contact_id])
  end


  private

  def message_params
    params.require(:message).permit(:content, :contact_id, :user_id)
  end
end
