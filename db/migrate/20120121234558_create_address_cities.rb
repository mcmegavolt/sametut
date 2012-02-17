class CreateAddressCities < ActiveRecord::Migration
  def change
    create_table :address_cities do |t|
      t.string :name
      t.references :region
    end
    add_index :address_cities, :region_id
  end
end