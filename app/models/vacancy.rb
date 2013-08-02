class Vacancy < ActiveRecord::Base

  attr_accessible :school_id, :value, :specialty_id, :expiry_date

  belongs_to :specialty

  belongs_to :school

  validates_presence_of :value, :specialty_id, :expiry_date

end
