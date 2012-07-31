class Specialty < ActiveRecord::Base

  belongs_to :specialty_category

  validates_presence_of :name, :specialty_category_id

  def to_s
    name
  end

end
