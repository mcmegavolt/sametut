class ChiefProfile < ActiveRecord::Base

  belongs_to :department

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

  validates_presence_of :name

  mount_uploader :chief_photo, DepartmentChiefPhotoUploader

end
