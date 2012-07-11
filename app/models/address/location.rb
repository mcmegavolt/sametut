class Location < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end


  belongs_to :addressable, :polymorphic => true
  belongs_to :city
  belongs_to :school

  validates_presence_of :city

  acts_as_gmappable :validation => true

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    #"#{self.street}, #{self.city}, #{self.country}"
    @country = I18n.t(:'site.address.ukraine')
    #"#{self.street}, #{self.city}, #{@country}"
    "#{@country}, #{City.find(self.city).name}, #{self.street}"
  end

end
