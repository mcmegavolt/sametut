class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :school_id
      t.integer :education_degree_level_id
      t.integer :education_school_type_id
      t.string :faculty
      t.integer :applicant_id

      t.timestamps
    end
  end
end