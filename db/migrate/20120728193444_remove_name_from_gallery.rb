class RemoveNameFromGallery < ActiveRecord::Migration
  def change
    remove_column :galleries, :name
  end
end
