class AddSublocalityToAddressLocation < ActiveRecord::Migration
  def change
    add_column :address_locations, :sublocality, :string
  end
end
