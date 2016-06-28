class ChangeColumnState < ActiveRecord::Migration
  def change
  	remove_column :supports, :state
  	add_reference :supports, :state, index: true, foreign_key: true
  end
end
