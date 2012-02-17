class CreateSocialActivities < ActiveRecord::Migration
  def change
    create_table :social_activities do |t|
      t.integer :applicant_id
      t.string :activity_type
      t.string :duties
      t.string :position

      t.timestamps
    end
  end
end
