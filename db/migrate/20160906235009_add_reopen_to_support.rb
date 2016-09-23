class AddReopenToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :re_open, :datetime
  end
end
