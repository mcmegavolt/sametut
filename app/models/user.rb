class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model

  validates_presence_of :user_type_id

  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type_id

  has_one :applicant, :dependent => :destroy

  has_one :school, :dependent => :destroy

  accepts_nested_attributes_for :applicant

  def online?
  updated_at > 10.minutes.ago
  end


end
