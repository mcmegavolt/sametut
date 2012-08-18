class EducationDegreeLevel < ActiveRecord::Base

  attr_accessible :education_degree_level, :educations

  has_many :educations

end
