class AddParentToRegion < ActiveRecord::Migration
  def change
    add_column :address_regions, :parent_id, :integer
  end
end
