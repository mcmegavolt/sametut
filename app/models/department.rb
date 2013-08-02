class Department < ActiveRecord::Base

  belongs_to :user

  has_one :chief_profile, :dependent => :destroy
  accepts_nested_attributes_for :chief_profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

  validates_presence_of :name

  def to_param
    "#{id}-#{permalink}"
  end

  def to_s
    name
  end

  def permalink
    I18n.transliterate(name).parameterize
  end


end
