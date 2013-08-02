class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description
      t.string :permalink
      t.references :location
      t.references :user
    end
    add_index :departments, :user_id
    add_index :departments, :location_id
  end
end
