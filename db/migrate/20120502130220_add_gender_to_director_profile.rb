class AddGenderToDirectorProfile < ActiveRecord::Migration
  def change
    add_column :director_profiles, :gender, :integer
  end
end
