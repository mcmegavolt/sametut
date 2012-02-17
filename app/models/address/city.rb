class Address::City < ActiveRecord::Base
  include Address
  belongs_to :region, :class_name => 'Address::Region'
  validates :name, :uniqueness => { :scope => :region_id }
  has_many :locations

  #def to_s
    #name
  #end
end
