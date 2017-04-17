class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :listing_name
      t.text :summary
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.integer :price
      t.boolean :active
      t.string :degree
      t.string :gender
      t.string :medical_license_number
      t.string :category
      t.text :biography
      t.text :education
      t.string :practice
      t.string :phone
      t.string :address
      t.string :email
      t.boolean :accepting_insurance
      t.text :insurance_providers
      t.text :languages
      t.text :board_certifications
      t.text :specialities
      t.string :website
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
