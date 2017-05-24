class CreateBreakthroughs < ActiveRecord::Migration
  def change
    create_table :breakthroughs do |t|
      t.integer :room_id
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end
