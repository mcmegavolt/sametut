class Download < ActiveRecord::Base
  attr_accessible :description, :name, :src, :src_cache
  mount_uploader :src, DownloadSourceUploader
end
