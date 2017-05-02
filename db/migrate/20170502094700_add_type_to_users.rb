class AddTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    remove_column :users, :account_type
  end
end
