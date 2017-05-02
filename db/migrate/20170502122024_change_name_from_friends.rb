class ChangeNameFromFriends < ActiveRecord::Migration
  def change
  	rename_column :friends, :name, :fullname
  end
end
