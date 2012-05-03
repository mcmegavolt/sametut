class AddUserIdToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :user_id, :integer
  end
end
