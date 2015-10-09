class LocationsController < ApplicationController
	layout "newui"
	require 'net/http'

	def index
	    @locations = Location.all
	end

	def show
		@location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
      if @location.save
      	descriptions = get_api_connection(@location)
      	create_location_descriptions(descriptions,@location)
      	# https://maps.googleapis.com/maps/api/place/autocomplete/json?input=<@location.name>&types=geocode&key=token 
        redirect_to @location, notice: 'Location was successfully created.'
      else
  			render :new
      end
  end

  def get_api_connection(location)
  	binding.pry
  	token = "#{Rails.application.secrets[:services]}"
  	uri = URI("https://maps.googleapis.com/maps/api/place/autocomplete/json?input="+location.name+"&types=geocode&key="+token)
		descriptions = JSON.parse(Net::HTTP.get(uri))['predictions'].first.values.first
	end

	def create_location_descriptions(descriptions,location)
		loc_descr = LocationPrediction.new(description: descriptions,location_id: location.id)
		loc_descr.save
	end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name)
    end

end
