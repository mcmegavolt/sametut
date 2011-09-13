class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :user_id

      t.timestamps
    end
  end
end
