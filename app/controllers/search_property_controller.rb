class SearchPropertyController < ApplicationController
  def index
  	if params[:city].present? || params[:price_range_min].present? || params[:price_range_max].present? || params[:province].present? || params[:holding_type].present?
      @properties = Property.search(params)
    	@properties = Kaminari.paginate_array(@properties).page(params[:page]).per(10)
  	else
  		@properties = Property.all
  		@properties = Kaminari.paginate_array(@properties).page(params[:page]).per(10)
  	end
  end

  def show
  	@property = Property.find(params[:property_id])
    @properties = Property.where('holding_type=?', @property.holding_type)
    @properties = @properties.where.not('id=?', params[:property_id])
    @properties = Kaminari.paginate_array(@properties).page(params[:page]).per(10)
  end
end
