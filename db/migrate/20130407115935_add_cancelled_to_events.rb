class AddCancelledToEvents < ActiveRecord::Migration
  def change
    add_column :events, :cancelled, :boolean
  end
end
