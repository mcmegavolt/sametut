class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|

      t.string :name
      t.belongs_to :galleryable, :polymorphic => true

      t.timestamps
    end
    add_index :galleries, [:galleryable_id, :galleryable_type], :name => 'galleries_index'
  end
end
