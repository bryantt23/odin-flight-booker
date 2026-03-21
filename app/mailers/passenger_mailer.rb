class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"
  default from: "bryantt23@gmail.com"

  def welcome_email
    params[:params].passengers.to_a.map { |p| p.name }

    puts "passengers #{params[:params].passengers}"
    puts "attrs #{params[:params].attributes}"
    puts "email_address #{params[:params][:email_address]}"
    puts "flight_id #{params[:params][:flight_id]}"
    @flight_id=params[:params][:flight_id]
    @email_address=params[:params][:email_address]


    params[:params].passengers.to_a.each do  |passenger|
      @passenger_name=passenger.name

      mail(to: @email_address)
    end

    # @user = params[:user]
    # @url = "http://example.com/login"
    # mail(to: @user.email, subject: "Welcome to My Awesome Site")


    puts "hiii"
    # mail(to: "bryantt23@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
