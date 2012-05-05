class City < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end
  belongs_to :region
  validates :name, :uniqueness => { :scope => :region_id }
  validates_presence_of :region
  has_many :locations
  has_many :schools
end
