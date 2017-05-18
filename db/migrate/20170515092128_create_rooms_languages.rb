class CreateRoomsLanguages < ActiveRecord::Migration
  def change
    create_table :rooms_languages do |t|
      t.references :room, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
