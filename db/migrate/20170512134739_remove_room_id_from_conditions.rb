class RemoveRoomIdFromConditions < ActiveRecord::Migration
  def change
    remove_reference :conditions, :room, index: true, foreign_key: true
    rename_column :conditions, :condition, :name
  end
end
