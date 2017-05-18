class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :room, index: true, foreign_key: true
      t.string :school
      t.date :date

      t.timestamps null: false
    end
  end
end
