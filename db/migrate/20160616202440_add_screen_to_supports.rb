class AddScreenToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :screen, :string
  end
end
