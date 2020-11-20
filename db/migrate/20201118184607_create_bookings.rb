class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :account
      t.belongs_to :vehicle
      t.belongs_to :driver
      t.belongs_to :dispatcher
      t.datetime :date
      t.datetime :pick_up_time
      t.datetime :drop_off_time
      t.string :pick_up_address
      t.string :drop_off_address
      t.string :trip_type
      t.string :trip_status
      t.decimal :price
      t.string :payment_type
      t.string :vehicle_type
      t.string :special_notes
      t.string :internal_notes
      t.string :passenger_name
      t.string :passenger_number

      t.timestamps
    end
  end
end
