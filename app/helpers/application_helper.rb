module ApplicationHelper

  def get_title
    self.controller_name.upcase
  end

  def new_message_form
    if params["controller"] == "groups"
      render 'groups/new_group_message', group: @group
    elsif params["controller"] == "contacts"
      render 'contacts/new_message', contact: @contact
    else
      render file: 'users/show'
    end
  end

end
