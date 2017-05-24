class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :room_id
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end
