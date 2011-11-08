class Education < ActiveRecord::Base

  belongs_to :applicant

  belongs_to :education_degree_level

  belongs_to :education_school_type

  belongs_to :school

end
