class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :applicant_id
      t.date :start_date
      t.date :end_date
      t.string :organization
      t.string :position
      t.string :duties

      t.timestamps
    end
  end
end
