class ContactsController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:new, :show, :create]


  def new
    @contact = Contact.find(params[:contact][:id])
    if @user.contacts.include?(@contact)
      redirect_to contact_path(@contact)
    else
      @user.contacts << @contact
      redirect_to contact_path(@contact)
    end
  end

  def create
  end

  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
    @group = Group.new
    messages = []

    messages << Message.where(user_id: @user.id, contact_id: @contact.id)

    messages << Message.where(user_id: @contact.id, contact_id: @user.id)

    @conversation = messages.flatten.sort_by { |m| m.created_at}.uniq.drop(1)
  end

  private

  def contact_params
    params.require(:contact).permit(:username)
  end

end
