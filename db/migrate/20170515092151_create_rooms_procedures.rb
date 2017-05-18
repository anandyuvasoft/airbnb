class CreateRoomsProcedures < ActiveRecord::Migration
  def change
    create_table :rooms_procedures do |t|
      t.references :room, index: true, foreign_key: true
      t.references :procedure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
