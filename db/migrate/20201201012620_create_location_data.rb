class CreateLocationData < ActiveRecord::Migration[6.0]
  def change
    create_table :location_data do |t|
      t.integer :booking_id
      t.string :pick_up_longitude
      t.string :pick_up_latitude
      t.string :drop_off_latitudedrop_off_longitude

      t.timestamps
    end
  end
end
