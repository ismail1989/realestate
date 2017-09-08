class WelcomeController < ApplicationController
  def index    
  	@flat = Property.where('holding_type=?', 'Appartment')
  	@flat_sorted = @flat.order(created_at: :desc).reverse_order.limit(4).reverse
  	@luxury = Property.where('holding_type=?', 'Luxury-Flat')
  	@luxury_sorted = @luxury.order(created_at: :desc).reverse_order.limit(4).reverse
  	@house_villas = Property.where('holding_type=?', 'House-Villa')
  	@house_villas_sorted = @house_villas.order(created_at: :desc).reverse_order.limit(4).reverse
  	@lands = Property.where('holding_type=?', 'Lands')
  	@lands_sorted = @lands.order(created_at: :desc).reverse_order.limit(4).reverse
  	@other_holdings = Property.where('holding_type=?', 'Other Holding')
  	@other_holdings_sorted = @other_holdings.order(created_at: :desc).reverse_order.limit(4).reverse
  	@slides = Slider.all
  	@sliders = []
  	@slides.each do |slider|
  		slider.slider.each do |file|
  			@sliders << file.url
  		end
  	end
  end
end
