class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.references :room, index: true, foreign_key: true
      t.string :procedure

      t.timestamps null: false
    end
  end
end
