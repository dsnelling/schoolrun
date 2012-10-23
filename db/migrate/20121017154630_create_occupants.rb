class CreateOccupants < ActiveRecord::Migration
  def change
    create_table :occupants do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
