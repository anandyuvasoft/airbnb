class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.integer :price
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
