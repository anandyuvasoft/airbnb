class RemoveRoomIdFromLanguages < ActiveRecord::Migration
  def change
    remove_reference :languages, :room, index: true, foreign_key: true
    rename_column :languages, :language, :name        
  end
end
