class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :account_type, :string
  end
end
