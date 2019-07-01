class ContactsController < ApplicationController
  before_action :find_user, only: [:show, :create]

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.find_by(username: params[:contact][:username])
    if !contact
      @user.contacts << Contact.create(contact_params)
      redirect_to contact_path(@user.contacts.last)
    else
      flash[:notice] = "You're already connected to #{contact.username}"
      redirect_to @user
    end
  end

  def show
    @contact = Contact.find(params[:id])

    messages = []

    messages << sent = Message.where(user_id: @user.id, contact_id: params[:id])

    messages << received = Message.where(user_id: params[:id], contact_id: @user.id)

    @conversation = messages.flatten.sort_by { |m| m.created_at}.uniq

  end

  private

  def find_user
    @user = User.find(session[:user_id])
  end

  def contact_params
    params.require(:contact).permit(:username)
  end

end
