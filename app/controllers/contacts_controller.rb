class ContactsController < ApplicationController
  before_action :find_user, only: [:show]

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

end
