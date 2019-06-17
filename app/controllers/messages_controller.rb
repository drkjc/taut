class MessagesController < ApplicationController
  before_action :find_user, only: [:index, :show, :edit]

  def index
  end

  private

  def find_user
    @user = User.find(session[:id])
  end
end
