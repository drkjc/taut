class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :group_messages, :user_id, :integer
  end
end
