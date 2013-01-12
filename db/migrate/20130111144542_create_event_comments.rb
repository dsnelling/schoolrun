class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.integer :event_id
      t.text :comment
      t.string :comment_by

      t.timestamps
    end
  end
end
