class AddPriorityToSupport < ActiveRecord::Migration
  def change
    add_reference :supports, :priority, index: true, foreign_key: true
  end
end
