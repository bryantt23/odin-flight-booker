class FlightsController < ApplicationController
  def index
    @flights=Flight.all
    @airports=Airport.all
    @flight_dates=Flight.all.map{|f|f.start.strftime("%m/%d/%Y")}.uniq
  end

  def create
    @flight=Flight.new(flight_params)
  end

  private
  def flight_params
    params.require(:flight).permit(:placeholder)
  end
end
