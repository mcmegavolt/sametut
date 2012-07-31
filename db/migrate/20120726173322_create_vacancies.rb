class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.integer :specialty_id

      t.timestamps
    end
  end
end
