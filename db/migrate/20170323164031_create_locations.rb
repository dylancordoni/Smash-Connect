class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.string :address
      t.string :zipcode

      t.integer :locationable_id
      t.string  :locationable_type

      t.timestamps
    end
  end
end
