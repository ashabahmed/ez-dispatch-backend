class BookingsController < ApplicationController
  
  def index
    bookings = Booking.all
    render json: bookings
  end

  def show
    booking = Booking.find(params[:id])

    render json: booking
  end

  def create
    dispatcher = Dispatcher.find(params[:dispatcher])
    account = Account.find(params[:account])
    date = params[:date]
    pick_up_time = params[:pick_up_time]
    passenger_name = params[:passenger_name]
    vehicle_type = params[:vehicle_type]
    passenger_number = params[:passenger_number]
    pick_up_address = params[:pick_up_address]
    drop_off_address = params[:drop_off_address]
    special_notes = params[:special_notes]
    internal_notes = params[:internal_notes]
    trip_status = "Booked"

    booking = Booking.create(
      dispatcher: dispatcher, account: account, date: date, pick_up_time: pick_up_time, 
    passenger_name: passenger_name, vehicle_type: vehicle_type, passenger_number: passenger_number, pick_up_address: pick_up_address,
    drop_off_address: drop_off_address, special_notes: special_notes, internal_notes: internal_notes, trip_status: trip_status)

    render json: booking
  end

  def update
    booking = Booking.find(params[:id])

    booking.update!(booking_params)

    render json: booking
  end

  def update_booking_location
    booking = Booking.find(params[:id])
    lp = booking.location_point || LocationPoint.new
    lp.pick_up_longitude = params[:booking][:pick_up_longitude].to_f
    lp.pick_up_latitude = params[:booking][:pick_up_latitude].to_f
    lp.drop_off_longitude = params[:booking][:drop_off_longitude].to_f
    lp.drop_off_latitude = params[:booking][:drop_off_latitude].to_f
    lp.location_found = params[:booking][:location_found]
    lp.distance = params[:booking][:distance]
    lp.duration = params[:booking][:duration]
    lp.save
    booking.location_point = lp
    booking.save
    render json: booking
  end

  private 

  def booking_params
    params.require(:booking).permit!
  end
end
