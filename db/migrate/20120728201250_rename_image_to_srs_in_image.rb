class RenameImageToSrsInImage < ActiveRecord::Migration
  def change
    rename_column :images, :image, :src
  end
end
