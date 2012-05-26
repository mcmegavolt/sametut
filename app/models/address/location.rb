class Location < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end

  belongs_to :city

  belongs_to :addressable, :polymorphic => true

  belongs_to :school

  validates_presence_of :city

end
