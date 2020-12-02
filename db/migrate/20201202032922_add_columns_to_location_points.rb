class AddColumnsToLocationPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :location_points, :distance, :string
    add_column :location_points, :duration, :string
  end
end
