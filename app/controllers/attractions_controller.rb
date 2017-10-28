class AttractionsController < ApplicationController
  before_action :require_login
  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def ride
    raise params.inspect
    ride = Ride.new(ride_params)
    ride.take_ride
    redirect_to current_user_path
  end

  private
  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
  def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :happiness_rating,
      :nausea_rating,
      :tickets,
    )
  end

  def ride_params
    params.require(:ride).permit(:user, :attraction)
  end
end
