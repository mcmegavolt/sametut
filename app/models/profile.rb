class Profile < ActiveRecord::Base
  belongs_to :applicant


  validates_presence_of :birth_date, :birth_location, :current_location

end
