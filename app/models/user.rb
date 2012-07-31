class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model

  validates_presence_of :user_type_id

  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type_id

  has_one :applicant, :dependent => :destroy
  accepts_nested_attributes_for :applicant

  has_one :school, :dependent => :destroy
  accepts_nested_attributes_for :school

  belongs_to :user_type

  def online?
  updated_at > 10.minutes.ago
  end

  def applicant?
    user_type_id == 1
  end

  def school?
    user_type_id == 2
  end

  def department?
    user_type_id == 3
  end


end
