class AddBirthLocationAndCurrentLocationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :birth_location, :string
    add_column :profiles, :current_location, :string
  end
end
