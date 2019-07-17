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
      message1 = Message.create(message_params)
      message2 = Message.create(content: params[:message][:content], user_id: params[:message][:contact_id], contact_id: params[:message][:user_id])
      # find the user using the contact_id
      # find the contact with the user id
      # associate user and contact
      redirect_to contact_path(contact)
      #user = kelley (1)
      #contact = derek (2)
      # message user_id: 1 contact_id 2
      #user.contacts = [derek]
      #contacts.user = [kelley]
      #d = User.find(contact.id) = derek user object
      #c = Contact.find(user.id) = kelley contact object
      #d.contacts << c
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
    binding.pry
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
