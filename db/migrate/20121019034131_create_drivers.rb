class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :status
      t.text :comment

      t.timestamps
    end
  end
end
