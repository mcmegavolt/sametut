class AddAdminIdToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :admin_id, :integer
  end
end
