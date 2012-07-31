class Gallery < ActiveRecord::Base

  attr_accessible :galleryable_id, :galleryable_type

  attr_accessible :pictures_attributes

  belongs_to :galleryable, :polymorphic => true

  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => lambda { |i| i[:src].blank? }

  def to_s
    name
  end

end
