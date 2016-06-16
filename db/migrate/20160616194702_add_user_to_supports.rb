class AddUserToSupports < ActiveRecord::Migration
  def change
    add_reference :supports, :user, index: true, foreign_key: true
  end
end
