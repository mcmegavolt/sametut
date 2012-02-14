class School < ActiveRecord::Base

  has_many :educations

  has_one :location

end
