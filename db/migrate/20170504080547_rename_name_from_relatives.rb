class RenameNameFromRelatives < ActiveRecord::Migration
  def change
    rename_column :relatives, :name, :fullname
    rename_column :relatives, :phone, :phone_number
    remove_column :relatives, :age
    rename_column :relatives, :date_of_birth, :birthday
    change_column :relatives, :birthday, :datetime
  end
end
