class EducationSchoolType < ActiveRecord::Base
  SCHOOL_TYPES = [['One', 1],['Two', 2],['Three', 3]].freeze
  PROMPT_TEXT = ['-Select'].freeze

  has_many :educations

end
