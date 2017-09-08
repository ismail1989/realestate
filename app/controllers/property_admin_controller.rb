class PropertyAdminController < ApplicationController
  def index
  	@flat_appartments = Property.where('holding_type=?', 'Flat-Appartment').count
  	@luxury_flats = Property.where('holding_type=?', 'Luxury-Flat').count
  	@house_villas = Property.where('holding_type=?', 'House-Villa').count
  	@lands = Property.where('holding_type=?', 'Lands').count
  	@other_holdings = Property.where('holding_type=?', 'Other Holding').count
  	@properties = Property.all
  end
end
