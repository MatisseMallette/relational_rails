class ApartmentTenantsController < ApplicationController
  def index 
    @apartment = Apartment.find(params[:apartment_id])
    @tenants = @apartment.tenants.all 
  end
end