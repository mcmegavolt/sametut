class Address::Location < ActiveRecord::Base
  belongs_to :city
  belongs_to :addressable, :polymorphic => true
end
