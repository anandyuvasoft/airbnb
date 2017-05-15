class RemoveRoomIdFromInsurances < ActiveRecord::Migration
  def change
    remove_reference :insurances, :room, index: true, foreign_key: true
    rename_column :insurances, :insurance_provider, :name    
  end
end
