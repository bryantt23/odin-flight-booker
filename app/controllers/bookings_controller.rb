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
    @booking=Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    end
  end

  def show
    @booking=Booking.find(params[:id])
    @flight=Flight.find(@booking.flight_id)
    @passengers=@booking.passengers
  end

  private
  def booking_params
    params.require(:booking).permit(
      :email_address,
      :flight_id,
      passengers_attributes: [ :name ]
    )
  end
end
