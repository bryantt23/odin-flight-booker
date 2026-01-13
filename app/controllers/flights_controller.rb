class FlightsController < ApplicationController
  def index
    @flights=Flight.all
    @airports=Airport.all
    @flight_dates=Flight.all.map { |f|f.start.strftime("%m/%d/%Y") }.uniq
    @url=request.original_url

    puts request.original_url
    puts "arrival_airport #{params[:arrival_airport]}"
    puts "passengers #{params[:passengers]}"
    @params=params
    @date=Date.strptime(params[:date], "%m/%d/%Y")
    puts @date
    @search_results=Flight.where(departure_airport: params[:departure_airport], arrival_airport: params[:arrival_airport], start: @date.beginning_of_day..@date.end_of_day)
      puts @search_results
  end

  def create
    @flight=Flight.new(flight_params)
  end

  private
  def flight_params
    params.require(:flight).permit(:placeholder)
  end
end
