class CreateLocationPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :location_points do |t|
      t.integer :booking_id
      t.boolean :location_found, null: false, :default => false
      t.decimal :pick_up_longitude, precision: 7
      t.decimal :pick_up_latitude, precision: 7
      t.decimal :drop_off_latitude, precision: 7
      t.decimal :drop_off_longitude, precision: 7

      t.timestamps
    end
  end
end
