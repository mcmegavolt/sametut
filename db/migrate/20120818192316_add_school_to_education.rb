class AddSchoolToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :school, :string
  end
end
