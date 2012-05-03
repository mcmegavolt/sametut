class CreateDirectorProfiles < ActiveRecord::Migration
  def change
    create_table :director_profiles do |t|
      t.string :name
      t.integer :school_id
      t.string :director_photo
      t.timestamps
    end
  end
end
