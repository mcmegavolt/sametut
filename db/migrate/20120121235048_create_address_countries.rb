class CreateAddressCountries < ActiveRecord::Migration
  def change
    create_table :address_countries do |t|
      t.string :name
    end
  end
end