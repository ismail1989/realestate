class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  def flats
    @flat_appartments = Property.where('holding_type=?', 'Flat-Appartment')
  end

  def luxury
    @luxury_flats = Property.where('holding_type=?', 'Luxury-Flat')
  end

  def house_villas
    @house_villas = Property.where('holding_type=?', 'House-Villa')
  end

  def lands
    @lands = Property.where('holding_type=?', 'Lands')
  end

  def other_holdings
    @other_holdings = Property.where('holding_type=?', 'Other Holding')
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:country, :province, :city, :address, :holding_type, :project_name, :project_code, :property_name, :property_code, :main_photo, :cover_photo, :city_location_photo, :description, :price, :featured, :latitude, :longitude, :facilities => [], :gallery_photos => [], :floor_plan_photos => [])
    end
end
