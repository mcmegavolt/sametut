class Picture < ActiveRecord::Base

  attr_accessible :title, :description, :src, :src_cache, :gallery_id

  belongs_to :gallery

  mount_uploader :src, ImageUploader

end
