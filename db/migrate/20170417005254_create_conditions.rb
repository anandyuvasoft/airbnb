class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.references :room, index: true, foreign_key: true
      t.string :condition

      t.timestamps null: false
    end
  end
end
