class Api::TripsController < ApplicationController
  def index
    render json: Trip.all
  end

  def create
    trip = Trip.new(trip_params)
    if trip.save
      render json: trip
    else
      render json: { errors: trip.errors }, status: :unprocessable_entity 
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(name: params[:name])
    render json: trip
    # trip = Trip.find(params[:id])
    # trip.update(complete: !trip.complete)
    # render json: trip
  end

  def destroy
    Trip.find(params[:id]).destroy
    render json: { message: 'Trip deleted' }
  end

  private

  def trip_params
    params.require(:trip).permit(:name)
  end

end