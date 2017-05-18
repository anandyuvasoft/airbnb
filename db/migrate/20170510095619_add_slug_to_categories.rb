class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    add_column :symptoms, :slug, :string
    add_index :categories, :slug, unique: true
    add_index :symptoms, :slug, unique: true
  end
end
