class CreateSpecialtyCategories < ActiveRecord::Migration
  def change
    create_table :specialty_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
