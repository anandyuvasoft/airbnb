class CreateRoomsConditions < ActiveRecord::Migration
  def change
    create_table :rooms_conditions do |t|
      t.references :room, index: true, foreign_key: true
      t.references :condition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
