class Department < ActiveRecord::Base

  belongs_to :user

  has_one :chief_profile, :dependent => :destroy
  accepts_nested_attributes_for :chief_profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

  has_one :gallery, :as => :galleryable, :dependent => :destroy
  accepts_nested_attributes_for :gallery, :allow_destroy => true


  has_many :school_departments, :dependent => :destroy
  accepts_nested_attributes_for :school_departments, :allow_destroy => true
  has_many :schools, :through => :school_departments

  has_many :vacancies, through: :schools

  validates_presence_of :name

  # def school_ids=(ids)
  #   self.schools = School.find(ids)
  # end

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
