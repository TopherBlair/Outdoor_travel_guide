class TripsController < ApplicationController

before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
before_action :set_users, only: [:new, :edit]

  def index
  	@trips = Trip.all
  end
  
  def show
  	@trip = Trip.find(params[:id])
    
  end

  def new
  	@trip = current_user.trips.build
  end

  def create
  	@trip = current_user.trips.build(trip_params)

  	if @trip.save
  		redirect_to trips_path
  	else
  		render :new
  	end
  end

  def edit
  	@trip = Trip.find(params[:id])
  end

  def update
  	@trip = Trip.find(params[:id])

  	if @trip.update_attributes(trip_params)
  		redirect_to trips_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@trip = Trip.find(params[:id])
  	@trip.destroy
  	redirect_to trips_path
  end

  private

  def set_users
    @users = User.all
  end

  def trip_params
  	params.require(:trip).permit(:name, :user_id)
  end
end
