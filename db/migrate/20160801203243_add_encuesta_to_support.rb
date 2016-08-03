class AddEncuestaToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :encuesta, :integer, default: 0
  end
end
