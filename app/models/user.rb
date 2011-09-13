class User < ActiveRecord::Base
  has_one :applicant, :dependent => :destroy
  accepts_nested_attributes_for :applicant


  validates :email,
            :presence => true,
            :uniqueness => true,
            :length => { :maximum => 50 }

  validates :permalink,
            :presence => false,
            :allow_blank => false,
            :uniqueness => true,
            :length => { :maximum => 30 }


  validates_associated :applicant

end
