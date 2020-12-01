class DropLocationDatum < ActiveRecord::Migration[6.0]
  def change
    drop_table :location_data
  end
end
