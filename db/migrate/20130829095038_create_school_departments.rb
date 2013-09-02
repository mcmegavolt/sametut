class CreateSchoolDepartments < ActiveRecord::Migration
  def change
    create_table :school_departments do |t|
      t.integer :department_id
      t.integer :school_id

      t.timestamps
    end
    add_index :school_departments, :school_id
    add_index :school_departments, :department_id
  end
end
