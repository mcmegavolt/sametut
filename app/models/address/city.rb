class City < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end
  belongs_to :region
  validates :name, :uniqueness => { :scope => :region_id }
  validates_presence_of :region

  has_many :locations, through: :addressables

  has_many :schools, through: :locations

  def self.tokens(query)
    self.where("name like ?", "%#{query}%")
  end

  attr_accessor :region_name

  def region_name
    @region_name =  Region.find(self.region_id).name
  end

end
