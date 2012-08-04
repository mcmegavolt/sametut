class RemoveDescriptionFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :description
  end
end
