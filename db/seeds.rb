# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Company.destroy_all

car_types = ["Sedan", "SUV", "Stretch Limo", "Luxury Van", "Cargo Van", "Extended SUV"]

company = Company.create(name: "Good Cars")
puts "company created"
dispatcher1 = Dispatcher.create(username: "ashab1", password: "abc123", name: "Ashab Ahmed", company: company)
dispatcher2 = Dispatcher.create(username: "ashab2", password: "abc123", name: "John Doe", company: company)
dispatcher3 = Dispatcher.create(username: "ashab3", password: "abc123", name: "Steve Mann", company: company)
dispatcher4 = Dispatcher.create(username: "ashab4", password: "abc123", name: "Tony Malone", company: company)
dispatcher5 = Dispatcher.create(username: "ashab5", password: "abc123", name: "Eric Furman", company: company)


10.times {Driver.create(name: Faker::Name.unique.name, company: company, license: Faker::IDNumber.spanish_citizen_number , cell_number: Faker::PhoneNumber.cell_phone, 
active: true, created_by_dispatcher_id: Dispatcher.all.sample.id)}

20.times {Vehicle.create(vin_number: Faker::Vehicle.vin, license_plate: Faker::Vehicle.license_plate, company: company, vehicle_type: car_types.sample, 
make: Faker::Vehicle.make, model: Faker::Vehicle.model, year: Faker::Vehicle.year, mileage: Faker::Vehicle.mileage(min: 50_000, max: 250_000), 
created_by_dispatcher_id: Dispatcher.all.sample.id)}
puts "vehicles created"

50.times {Account.create(dispatcher: Dispatcher.all.sample, name: Faker::Name.unique.name, email: Faker::Internet.email , residence: Faker::Address.street_address, 
passengers:"", number: Faker::PhoneNumber.cell_phone, credit_cards: Faker::Business.credit_card_number )}
puts "accounts created"

80.times {
  date = Faker::Time.between(from: DateTime.now , to: DateTime.now + 5, format: :default)
  pick_up_time = (Faker::Time.between_dates(from: date, to: date, period: :morning))
  Booking.create(account: Account.all.sample, vehicle_type: car_types.sample ,vehicle: nil, driver: nil, 
  drop_off_address: Faker::Address.street_address, pick_up_address: Faker::Address.street_address, 
  dispatcher: Dispatcher.all.sample, date: date, pick_up_time: pick_up_time, drop_off_time: nil, trip_type: "", trip_status: "Booked", price: 0, payment_type: "", 
  special_notes:"", internal_notes:"", passenger_name: "", passenger_number: "")
}
puts "future dates created"
80.times {
  date = Faker::Time.between(from: DateTime.now - 5, to: DateTime.now, format: :default)
  pick_up_time = (Faker::Time.between_dates(from: date, to: date, period: :morning))
  drop_off_time = (Faker::Time.between_dates(from: date, to: date, period: :evening))

  account = Account.all.sample
  Booking.create(account: account, vehicle_type: car_types.sample, pick_up_address: Faker::Address.street_address, drop_off_address: Faker::Address.street_address, 
  vehicle: Vehicle.all.sample, driver: Driver.all.sample, dispatcher: Dispatcher.all.sample, date: date, pick_up_time: pick_up_time, drop_off_time: drop_off_time, 
  trip_type: "Ground", trip_status: "Dropped", price: 80, payment_type: "", special_notes:"", internal_notes:"", passenger_name: account.name, 
  passenger_number: account.number)
}
puts "past dates created"