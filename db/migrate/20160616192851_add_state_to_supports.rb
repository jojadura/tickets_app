class AddStateToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :state, :integer
  end
end
