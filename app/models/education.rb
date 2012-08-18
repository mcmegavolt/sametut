class Education < ActiveRecord::Base

  attr_accessible :faculty, :school, :applicant_id, :end_date, :start_date, :education_degree_level_id

  belongs_to :applicant

  belongs_to :education_degree_level

  #belongs_to :school

end
