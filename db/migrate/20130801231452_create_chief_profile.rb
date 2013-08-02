class CreateChiefProfile < ActiveRecord::Migration
  def change
    create_table :chief_profiles do |t|
      t.string :name
      t.references :department
      t.string :chief_photo
      t.integer :gender
    end
    add_index :chief_profiles, :department_id
  end
end
