class AddressController < ApplicationController

  def index
    @cities = City.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @cities.map(&:name)
  end

end
