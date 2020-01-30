class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :session_token, :string, null: false
    add_column :users, :cheers, :integer, null: false
  end
end
