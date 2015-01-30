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
    @map = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction.latitude
      marker.lng attraction.longtitude
    end
  end

  def index
    @attractions = Attraction.all
  end

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
    redirect_to trip_path(Trip.find(@attraction.trip_id))
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def set_trip
    @trips = Trip.all
  end

  def attraction_params
    params.require(:attraction).permit(:title, :unique_id, :trip_id)
  end

end
