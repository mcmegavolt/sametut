class AddState2ToAddressLocation < ActiveRecord::Migration
  def change
    add_column :address_locations, :state2, :string
  end
end
