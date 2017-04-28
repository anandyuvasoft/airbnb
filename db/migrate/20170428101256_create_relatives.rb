class CreateRelatives < ActiveRecord::Migration
  def change
    create_table :relatives do |t|
      t.string :relation
      t.string :name
      t.string :email
      t.string :phone
      t.string :age
      t.string :gender
      t.date :date_of_birth
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
