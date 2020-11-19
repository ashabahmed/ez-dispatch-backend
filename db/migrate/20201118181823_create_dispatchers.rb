class CreateDispatchers < ActiveRecord::Migration[6.0]
  def change
    create_table :dispatchers do |t|
      t.string :username
      t.string :password
      t.string :name
      t.belongs_to :company

      t.timestamps
    end
  end
end
