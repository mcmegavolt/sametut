class DirectorProfile < ActiveRecord::Base

  belongs_to :school

  mount_uploader :director_photo, SchoolDirectorPhotoUploader

end
