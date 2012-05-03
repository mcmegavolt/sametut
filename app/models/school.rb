class School < ActiveRecord::Base

  belongs_to :education_school_type

  belongs_to :user

  has_one :director_profile, :dependent => :destroy
  accepts_nested_attributes_for :director_profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location,  :allow_destroy => true


  #attr_accessible :name, :location_attributes, :education_school_type_id, :director_profile_attributes

end
