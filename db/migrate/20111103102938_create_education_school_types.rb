class CreateEducationSchoolTypes < ActiveRecord::Migration
  def change
    create_table :education_school_types do |t|
      t.string :school_type_name
    end
  end
end
