class Applicant < ActiveRecord::Base
  belongs_to :user
  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
  has_many :social_activities, :dependent => :destroy
  accepts_nested_attributes_for :social_activities, :reject_if => lambda { |a| a[:social_activities].blank? }, :allow_destroy => true

  validates_presence_of :first_name, :middle_name, :last_name
  validates_associated :profile

end
