class CreateGroupMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_messages do |t|
      t.text :content
      t.integer :group_id

      t.timestamps
    end
  end
end
