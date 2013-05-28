class Location < ActiveRecord::Base

  include Address

  def self.table_name_prefix
    'address_'
  end

  belongs_to :addressable, :polymorphic => true

  belongs_to :school

  validates_presence_of :city, :street, :formatted_address

  acts_as_gmappable :msg => I18n.t(:'site.address.gmaps_error_html'), :validation => false

  def gmaps4rails_address
    formatted_address
  end

end
