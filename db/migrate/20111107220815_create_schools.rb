class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :type_id
      t.integer :city_id
    end
  end
end
