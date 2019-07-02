class ContactsController < ApplicationController
  before_action :find_user, only: [:new, :show, :create]

  def new
  end

  def create
    contact = Contact.find_by(id: params[:contact][:id])
    if contact
      @user.contacts << contact
      redirect_to contact_path(@user.contacts.last)
    else
      flash[:notice] = "That user doesn't have access to the group."
      redirect_to @user
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
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
