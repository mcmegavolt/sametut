class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name
      t.integer :specialty_category_id

      t.timestamps
    end
  end
end
