class AddStateToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :state, :boolean
  end
end
