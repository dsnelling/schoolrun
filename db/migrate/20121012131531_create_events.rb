class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :to_from
      t.date :event_date
      t.time :event_time
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
