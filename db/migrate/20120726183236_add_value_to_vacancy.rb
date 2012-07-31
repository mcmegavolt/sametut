class AddValueToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :value, :float

  end
end
