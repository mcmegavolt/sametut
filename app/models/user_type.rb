class UserType < ActiveRecord::Base

  has_many :users
  accepts_nested_attributes_for :users

  def to_s
    user_type_name
  end

end
