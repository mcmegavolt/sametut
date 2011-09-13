class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :permalink
      t.integer :user_type_id
      t.boolean :enabled

      t.timestamps
    end
  end
end
