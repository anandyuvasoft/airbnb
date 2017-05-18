class CreateRoomsInsurances < ActiveRecord::Migration
  def change
    create_table :rooms_insurances do |t|
      t.references :room, index: true, foreign_key: true
      t.references :insurance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
