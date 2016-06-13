class AddUserToSubCategory < ActiveRecord::Migration
  def change
    add_reference :sub_categories, :user, index: true, foreign_key: "id"
  end
end
