class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.references :room, index: true, foreign_key: true
      t.string :insurance_provider

      t.timestamps null: false
    end
  end
end
