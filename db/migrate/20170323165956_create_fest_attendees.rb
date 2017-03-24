class CreateFestAttendees < ActiveRecord::Migration
  def change
    create_table :fest_attendees do |t|
      t.integer :fest_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
