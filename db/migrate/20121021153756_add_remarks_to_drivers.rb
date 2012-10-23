class AddRemarksToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :remarks, :text
  end
end
