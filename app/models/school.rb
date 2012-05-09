class School < ActiveRecord::Base

  belongs_to :education_school_type

  belongs_to :user

  has_one :director_profile, :dependent => :destroy
  accepts_nested_attributes_for :director_profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location,  :allow_destroy => true

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

end
