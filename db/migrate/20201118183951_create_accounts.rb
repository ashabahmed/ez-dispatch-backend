class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :dispatcher
      t.string :name
      t.string :number
      t.string :email
      t.string :credit_cards
      t.string :residence
      t.string :passengers

      t.timestamps
    end
  end
end
