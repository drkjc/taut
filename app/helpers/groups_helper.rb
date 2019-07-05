module GroupsHelper

  def all_groups
    groups_array = []
    User.all.each do |user|
      if user.groups.first.name == @user.groups.first.name
        groups_array << user.groups
      end
    end
    groups_array.flatten.uniq
  end

end
