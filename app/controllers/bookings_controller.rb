class BookingsController < ApplicationController
  
  def index
    bookings = Booking.all
    render json: bookings
  end

  def create
    byebug
    booking = Booking.create()

    render json: booking
  end


end
