class Region < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end

  has_many :sub_regions, :class_name => 'Region', :foreign_key => 'parent_id', :dependent => :destroy

  has_many :cities

  has_many :locations, :through => :cities

  validates :name, :uniqueness => true

  scope :roots, where(:parent_id => nil)

  def root?
    parent_id.nil?
  end



end
