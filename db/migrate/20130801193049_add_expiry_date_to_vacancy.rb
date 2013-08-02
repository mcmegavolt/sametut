class AddExpiryDateToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :expiry_date, :date
  end
end
