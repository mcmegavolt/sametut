class AddPermalinkToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :permalink, :string

  end
end
