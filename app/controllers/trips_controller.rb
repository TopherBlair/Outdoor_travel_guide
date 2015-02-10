class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :show, :index]
  before_action :set_users, only: [:new, :edit]
  respond_to :html, :js

  def index
  	@trips = current_user.trips
	  respond_to do |format|
	  	format.html
	  	format.csv { render text: @trips.to_csv }
  	 end 
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
      respond_to do |format|
        format.html { redirect_to(trips_path) }
        format.js {render inline: "location.reload();" }
      end
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
  	  respond_to do |format|
        format.html { redirect_to(trips_path) }
        format.js {render inline: "location.reload();" }
      end  
  	else
  		render :edit
  	end
  end

  def destroy
  	@trip = Trip.find(params[:id])
  	@trip.destroy
  	redirect_to trips_path
  end

  def export_trip
    @trip = Trip.find(params[:id])
    UserMailer.trip_mailer(@trip, current_user).deliver
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
