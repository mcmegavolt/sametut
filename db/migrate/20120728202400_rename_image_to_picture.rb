class RenameImageToPicture < ActiveRecord::Migration
  def up
    rename_table :images, :pictures
  end

  def down
    rename_table :pictures, :images
  end
end
