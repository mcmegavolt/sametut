class CreateAddressRegions < ActiveRecord::Migration
  def change
    create_table :address_regions do |t|
      t.string :name
    end
  end
end