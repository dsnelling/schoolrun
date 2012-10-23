class AddRemarksToOccupants < ActiveRecord::Migration
  def change
    add_column :occupants, :remarks, :text
  end
end
