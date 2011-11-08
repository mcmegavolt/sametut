class EducationDegreeLevel < ActiveRecord::Base
  DEGREE_LEVELS = [['One', 1],['Two', 2],['Three', 3]].freeze
  PROMPT_TEXT = ['-Select']

  has_many :educations

end
