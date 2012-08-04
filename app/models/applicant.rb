class Applicant < ActiveRecord::Base

  belongs_to :user

  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile

  has_one :location, :as => :addressable,  :dependent => :destroy
  accepts_nested_attributes_for :location

  has_many :social_activities, :dependent => :destroy
  accepts_nested_attributes_for :social_activities, :reject_if => :social_activities_blank, :allow_destroy => true

  has_many :work_experiences, :dependent => :destroy
  accepts_nested_attributes_for :work_experiences, :reject_if => :work_experiences_blank, :allow_destroy => true

  has_many :educations, :dependent =>  :destroy
  accepts_nested_attributes_for :educations, :reject_if => :educations_blank, :allow_destroy => true

  validates_presence_of :first_name, :middle_name, :last_name
  validates_associated :profile

  def social_activities_blank entry
    entry[:activity_type].blank? && entry[:position].blank?
  end

  def work_experiences_blank entry
    entry[:organization].blank? && entry[:position].blank?
  end

  def educations_blank entry
    entry[:school_id].blank?
  end

  mount_uploader :avatar, ApplicantAvatarUploader


  def to_param
    "#{id}-#{permalink}"
  end

  def to_s
    self.first_name + ' ' + self.middle_name + ' ' + self.last_name
  end

  def permalink
    Russian.translit(self.first_name + '-' + self.middle_name + '-' + self.last_name).parameterize
  end

  def full_name
    first_name + middle_name + last_name
  end


end
