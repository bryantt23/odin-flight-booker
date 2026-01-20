class BookingsController < ApplicationController
  def new
    @booking=Booking.new
    params[:passengers].to_i.times do
      @booking.passengers.build
    end
    @flight=Flight.find(params[:search_results])
    @departure_airport=Airport.find(@flight.departure_airport.id).code
    @arrival_airport=Airport.find(@flight.arrival_airport.id).code
    puts params
    @params=params
  end

  def create
    puts params
    @params
  end
end
