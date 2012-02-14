class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :birth_date
      t.integer :birth_location_id
      t.integer :current_location_id
      t.string :video_url
      t.integer :applicant_id

      t.timestamps
    end
  end
end
