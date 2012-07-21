class Gallery < ActiveRecord::Base
  attr_accessible :name

  attr_accessor :image_attributes

  belongs_to :galleryable, :polymorphic => true

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => lambda { |i| i[:image].blank? }

end
