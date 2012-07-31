class AddSchoolIdToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :school_id, :integer

  end
end
