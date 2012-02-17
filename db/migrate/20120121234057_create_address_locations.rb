class CreateAddressLocations < ActiveRecord::Migration
  def change
    create_table :address_locations do |t|
      t.references :city
      t.string :street
      t.string :building
      t.string :apartment
      t.references :addressable, :polymorphic => true

      t.timestamps
    end
    add_index :address_locations, :city_id
  end
end