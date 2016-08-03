class AddDatependingDateprecloseToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :date_pending, :datetime
    add_column :supports, :date_preclose, :datetime
  end
end
