class EditUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :username
    add_index :users, :username, unique: true
    change_column_null :users, :username, false
  end
end
