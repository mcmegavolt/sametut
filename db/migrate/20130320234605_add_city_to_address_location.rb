class AddCityToAddressLocation < ActiveRecord::Migration
  def change
    add_column :address_locations, :city, :string
    add_column :address_locations, :formatted_address, :string
    add_column :address_locations, :state, :string
    add_column :address_locations, :postal_code, :string
  end
end
