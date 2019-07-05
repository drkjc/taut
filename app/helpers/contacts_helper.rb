module ContactsHelper

  #finds all users whose first groups is cats
  def all_contacts
    contact_array = []
    User.all.each do |user|
      if user.groups.first.name == @user.groups.first.name
        contact_array << user
      end
    end
    contact_array
  end

end
