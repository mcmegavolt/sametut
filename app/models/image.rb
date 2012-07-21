class Image < ActiveRecord::Base

  attr_accessible :title, :description

  belongs_to :gallery

  mount_uploader :image, ImageUploader

end
