class AddGoogleMapsForRailsToLocation < ActiveRecord::Migration
  def change
    add_column :address_locations, :latitude,  :float #you can change the name, see wiki
    add_column :address_locations, :longitude, :float #you can change the name, see wiki
    add_column :address_locations, :gmaps, :boolean #not mandatory, see wiki
  end
end
