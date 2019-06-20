class ContactsController < ApplicationController
  before_action :find_user, only: [:show, :create]

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.find_or_create_by(contact_params)
    if @user.contacts.include?(contact)
      redirect_to contact_path(contact)
    else
      @user.contacts << contact
      @user.save
      redirect_to contact_path(contact)
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
    @user = User.find(session[:id])
  end

  def contact_params
    params.require(:contact).permit(:username)
  end

end
