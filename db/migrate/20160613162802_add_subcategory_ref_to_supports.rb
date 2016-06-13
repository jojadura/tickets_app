class AddSubcategoryRefToSupports < ActiveRecord::Migration
  def change
    add_reference :supports, :sub_categories, index: true
  end
end
