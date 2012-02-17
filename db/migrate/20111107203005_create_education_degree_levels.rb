class CreateEducationDegreeLevels < ActiveRecord::Migration
  def change
    create_table :education_degree_levels do |t|
      t.string :education_degree_level
    end
  end
end
