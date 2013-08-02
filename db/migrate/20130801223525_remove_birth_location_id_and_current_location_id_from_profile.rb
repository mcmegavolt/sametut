class RemoveBirthLocationIdAndCurrentLocationIdFromProfile < ActiveRecord::Migration
  remove_column :profiles, :birth_location_id, :current_location_id
end
