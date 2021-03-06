class ContactsController < ApplicationController
  before_action :logged_in?
  before_action :find_user, only: [:new, :show, :create]
  before_action :new_group, only: [:show]


  def new
    if !params.include?("contact")
      flash[:contact_alert] = "Please select a contact."
      redirect_to group_path(@user.groups.first)
    elsif params[:contact][:id].empty?
      flash[:contact_alert] = "Please select a contact."
      redirect_to group_path(@user.groups.first)
    else
      @contact = Contact.find(params[:contact][:id])
      new_contact(@contact)
    end
  end

  def create
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact
      @message = Message.new(contact_id: params[:id], user_id: @user.id)
      contact_conversation(@contact)
    else
      flash[:contact_alert] = "Couldn't find that contact"
      redirect_to group_path(@user.groups.first)
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    @user.contacts.delete(contact)
    redirect_to group_path(@user.groups.first)
  end

  ####################### END ROUTES #####################

  private

  def contact_params
    params.require(:contact).permit(:username)
  end

  def contact_conversation(contact)
    messages = []
    messages << Message.sent_messages(@user, contact)
    messages << Message.received_messages(contact, @user)
    @convo = messages.flatten.sort_by { |m| m.created_at}.uniq { |m| m.content }.drop(1)
    @convo
  end

  def new_contact(contact)
    if @user.contacts.include?(contact)
      redirect_to contact_path(contact)
    else
      @user.contacts << contact
      redirect_to contact_path(contact)
    end
  end

end
