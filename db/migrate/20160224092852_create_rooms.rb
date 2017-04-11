class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accomodate
      t.integer :bed_room
      t.integer :bath_room
      t.string :listing_name
      t.text :summary
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_heating
      t.boolean :is_internet
      t.integer :price
      t.boolean :active
      t.string :degree
      t.string :gender
      t.string :medical_license_number
      t.string :category
      t.text :biography
      t.string :practice
      t.string :phone
      t.string :address
      t.string :email
      t.boolean :accepting_insurance
      t.string :website
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
