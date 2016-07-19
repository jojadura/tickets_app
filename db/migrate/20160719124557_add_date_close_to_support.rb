class AddDateCloseToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :date_close, :datetime
  end
end
