class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :title
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
