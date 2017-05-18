class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.references :room
      t.string :speciality

      t.timestamps null: false
    end
  end
end
