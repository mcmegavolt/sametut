class DirectorProfile < ActiveRecord::Base

  belongs_to :school

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

  mount_uploader :director_photo, SchoolDirectorPhotoUploader

end
