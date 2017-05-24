class RemoveDegreeFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :summary
    remove_column :rooms, :street
    remove_column :rooms, :city
    remove_column :rooms, :state
    remove_column :rooms, :gender
    remove_column :rooms, :zipcode
    remove_column :rooms, :country
    remove_column :rooms, :active
    remove_column :rooms, :degree
    remove_column :rooms, :medical_license_number
    remove_column :rooms, :category
    remove_column :rooms, :education
    remove_column :rooms, :dob
    remove_column :rooms, :practice_year_opened
    remove_column :rooms, :wikipedia
    remove_column :rooms, :specialities
    remove_column :rooms, :languages
    remove_column :rooms, :accepting_insurance
    remove_column :rooms, :board_certifications
    rename_column :rooms, :listing_name, :name
    add_column    :rooms, :opened_at, :datetime
  end
end
