class AddBiographyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biography, :text
    add_column :users, :degree, :string
    add_column :users, :license, :integer
    add_column :users, :category, :string
  end
end
