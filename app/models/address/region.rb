class Address::Region < ActiveRecord::Base
  include Address
  #belongs_to :country
  #belongs_to :region
  has_many :cities
  has_many :locations, :through => :cities

  validates :name, :uniqueness => true

  #def to_s
    #name
  #end
end
