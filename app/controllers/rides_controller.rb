class RidesController < ApplicationController
  before_action :require_login
  before_action :set_attraction, only: :show

  def index
    @rides = Ride.all
  end

  def create
    @ride = Ride.new(ride_params)
    message = @ride.take_ride
    session[:message] = message
    redirect_to current_user
  end

  private
  def set_attraction
    @ride = Ride.find_by(id: params[:id])
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
