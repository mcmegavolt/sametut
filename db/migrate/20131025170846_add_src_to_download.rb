class AddSrcToDownload < ActiveRecord::Migration
  def change
    add_column :downloads, :src, :string
  end
end
