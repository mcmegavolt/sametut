class SpecialtyCategory < ActiveRecord::Base

  has_many :specialties, :dependent => :destroy
  accepts_nested_attributes_for :specialties, :allow_destroy => true

  validates_presence_of :name

  def to_s
    name
  end

end
