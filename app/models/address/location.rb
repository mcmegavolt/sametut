class Location < ActiveRecord::Base
  
  include Address

  def self.table_name_prefix
    'address_'
  end

  belongs_to :city

  def city_name
    city.try(:name)
  end

  def city_name=(name)
    self.city = City.find_by_name(name) if name.present?
  end

  belongs_to :addressable, :polymorphic => true

  belongs_to :school

end
