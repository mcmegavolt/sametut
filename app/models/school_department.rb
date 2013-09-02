class SchoolDepartment < ActiveRecord::Base
  attr_accessible :department_id, :school_id

	belongs_to :department
	belongs_to :school

end
