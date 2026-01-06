# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "LAX", "JFK", "SFO" ].each do |airport|
  Airport.find_or_create_by!(code: airport)
end

LONG_FLIGHT_START_TIMES=[ 9, 17 ]
SHORT_FLIGHT_START_TIMES=[ 8, 12, 16, 20 ]

def get_time(hours)
  Time.zone.parse("2027-01-01 #{hours<10?"0#{hours}":hours}:00:00")
end

LONG_FLIGHT_START_TIMES.each do |start|
  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "JFK").id, arrival_airport: Airport.find_by(code: "LAX").id, start: get_time(start), duration_minutes: 300)
  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "LAX").id, arrival_airport: Airport.find_by(code: "JFK").id, start: get_time(start), duration_minutes: 300)

  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "JFK").id, arrival_airport: Airport.find_by(code: "SFO").id, start: get_time(start), duration_minutes: 360)
  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "SFO").id, arrival_airport: Airport.find_by(code: "JFK").id, start: get_time(start), duration_minutes: 360)
end



SHORT_FLIGHT_START_TIMES.each do |start|
  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "SFO").id, arrival_airport: Airport.find_by(code: "LAX").id, start: get_time(start), duration_minutes: 120)
  Flight.find_or_create_by!(departure_airport: Airport.find_by(code: "LAX").id, arrival_airport: Airport.find_by(code: "SFO").id, start: get_time(start), duration_minutes: 120)
end
