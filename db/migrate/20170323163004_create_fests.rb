class CreateFests < ActiveRecord::Migration
  def change
    create_table :fests do |t|
      t.datetime :event_time
      t.integer :host_id
      t.string :status, default: "OPEN"
      t.integer :max_people

      t.timestamps
    end
  end
end
