class School < ActiveRecord::Base

  attr_accessor :gallery_attributes

  belongs_to :education_school_type

  belongs_to :user

  has_one :director_profile, :dependent => :destroy
  accepts_nested_attributes_for :director_profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location

  has_many :contacts, :as => :contactable, :dependent => :destroy
  accepts_nested_attributes_for :contacts, :reject_if => lambda { |c| c[:value].blank? || c[:contact_type_id].blank? }, :allow_destroy => true

  has_one :gallery, :as => :galleryable, :dependent => :destroy
  accepts_nested_attributes_for :gallery, :allow_destroy => true

  has_many :vacancies, :dependent => :destroy
  accepts_nested_attributes_for :vacancies, :reject_if => lambda { |c| c[:vacancy_value_id].blank? || c[:vacancy_category_id].blank? }, :allow_destroy => true

  def to_param
    "#{id}-#{permalink}"
  end

  def to_s
    name
  end

  def permalink
    Russian.translit(name).parameterize
  end


end
