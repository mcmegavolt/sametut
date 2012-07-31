class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :title
      t.string :description
      t.integer :gallery_id
      t.timestamps
    end
  end
end
