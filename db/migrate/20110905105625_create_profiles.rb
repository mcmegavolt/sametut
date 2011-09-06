class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :birth_date
      t.string :birth_location
      t.string :current_location
      t.string :video_url


      t.timestamps
    end
    add_index :profiles, :applicant_id
  end
end
