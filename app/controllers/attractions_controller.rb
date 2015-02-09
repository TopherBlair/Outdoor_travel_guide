class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  before_action :set_trip, only: [:new, :edit]
  respond_to :html, :js
  
  def show
  end

  def attractions_api
    @api_unique_id_results = Apis::TrailsApi.get_trails_data_id(params['activities_unique_id'])
    @reviews = Review.where(unique_id: params['activities_unique_id'])
  end

  def api_index
    @api_results = Apis::TrailsApi.get_trails_data(params['city_location'], params['activity_type'])

    @markers = []
    @api_results['places'].each do |place|
      if place['lat'] != 0 && place['lon'] != 0
        h = {"lat" => place['lat'], "lng" => place['lon'], "name" => place['name'], "infowindow" => place['name']}
        @markers << h
      end
    end

  end

  # def index
  #   @attractions = Attraction.all
  # end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      respond_to do |format|
        format.html { redirect_to trip_path(Trip.find(@attraction.trip_id)) }
        format.js
      end
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @attraction.update_attributes(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to trips_path
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def set_trip
    @trips = Trip.all
  end

  def attraction_params
    params.require(:attraction).permit(:title, :unique_id, :trip_id, :latitude, :longitude)
  end

end
