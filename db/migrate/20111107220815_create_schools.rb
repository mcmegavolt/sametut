class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :education_school_type_id
      t.integer :location_id
    end
  end
end
