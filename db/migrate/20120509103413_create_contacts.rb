class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contact_type_id
      t.references :school
      t.references :profile
      t.references :director_profile
      t.references :contactable, :polymorphic => true
      t.string :value
      t.timestamps
    end
    add_index :contacts, :school_id
    add_index :contacts, :profile_id
    add_index :contacts, :director_profile_id
  end
end
