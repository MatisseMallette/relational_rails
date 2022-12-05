class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :address
      t.integer :rent
      t.boolean :rent_controlled
      t.timestamps
    end
  end
end
