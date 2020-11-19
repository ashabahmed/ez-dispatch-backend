class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license
      t.string :cell_number
      t.integer :created_by_dispatcher_id
      t.belongs_to :company

      t.timestamps
    end
  end
end
