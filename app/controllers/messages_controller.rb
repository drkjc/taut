class MessagesController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:index, :create]

  def index
  end

  def new
    redirect_to group_path(@user.groups.first)
  end

  def create
    contact = Contact.find_by(id: params[:contact_id])
    if params[:message][:content].empty?
      redirect_to contact_path(contact)
    else params[:contact_id]
      message1 = Message.create(message_params)
      message2 = Message.create(content: params[:message][:content], user_id: params[:message][:contact_id], contact_id: params[:message][:user_id])

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
    message1 = Message.find(params[:id])
    message2 = Message.find_by(content: message1.content, user_id: params[:contact_id])
    if !params[:message][:content].empty?
      message1.update(content: params[:message][:content])
      message2.update(content: params[:message][:content])
      redirect_to contact_path(contact)
    else
      flash[:alert] = "Form can't be blank"
      redirect_to edit_contact_message_path(contact, message)
    end
  end

  def destroy
    message1 = Message.find(params[:id])
    message2 = Message.find_by(content: message1.content, user_id: params[:contact_id])
    message1.delete
    message2.delete
    redirect_to contact_path(params[:contact_id])
  end


  private

  def message_params
    params.require(:message).permit(:content, :contact_id, :user_id)
  end
end
