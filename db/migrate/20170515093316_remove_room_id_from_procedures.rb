class RemoveRoomIdFromProcedures < ActiveRecord::Migration
  def change
    remove_reference :procedures, :room, index: true, foreign_key: true
    rename_column :procedures, :procedure, :name    
  end
end
