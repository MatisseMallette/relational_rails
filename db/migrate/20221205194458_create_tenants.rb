class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :number_of_pets
      t.boolean :has_job
      t.references :apartment, foreign_key: true
      t.timestamps
    end
  end
end
