class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.references :room, index: true, foreign_key: true
      t.string :language

      t.timestamps null: false
    end
  end
end
