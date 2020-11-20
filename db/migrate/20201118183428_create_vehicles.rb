class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.belongs_to :company
      t.string :vehicle_type
      t.string :year
      t.string :make
      t.string :model
      t.string :vin_number
      t.string :license_plate
      t.integer :mileage
      t.integer :created_by_dispatcher_id

      t.timestamps
    end
  end
end
