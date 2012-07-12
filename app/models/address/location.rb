class Location < ActiveRecord::Base
  include Address
  def self.table_name_prefix
    'address_'
  end


  belongs_to :addressable, :polymorphic => true
  belongs_to :city
  belongs_to :school

  validates_presence_of :city

  acts_as_gmappable :msg => I18n.t(:'site.address.gmaps_error_html'),
                    :validation => true

  def gmaps4rails_address
    @country = I18n.t(:'site.address.ukraine')
    #"#{@country}, #{City.find(self.city).name}, #{self.street}"
    "#{@country}, #{self.city.name}, #{self.street}, #{self.building}"
  end

  #def gmaps4rails_infowindow
  #  #"#{self.city}" + "#{self.city.region}"
  #  "#{self.city}"
  #end

end
