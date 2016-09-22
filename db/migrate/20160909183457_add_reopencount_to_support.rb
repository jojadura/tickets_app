class AddReopencountToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :re_open_count, :integer
  end
end
