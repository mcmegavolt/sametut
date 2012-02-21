class School < ActiveRecord::Base

  belongs_to :education_school_type

  attr_accessible :name, :education_school_type, :location

  has_one :location, :as => :addressable, :class_name => 'Address::Location', :dependent => :destroy
  accepts_nested_attributes_for :location

end
