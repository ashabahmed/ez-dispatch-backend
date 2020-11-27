class BookingSerializer < ActiveModel::Serializer
  attributes :id, :account, :vehicle, :driver, :dispatcher, 
  :date, :pick_up_time, :drop_off_time, :trip_type, 
  :trip_status, :price, :payment_type, :vehicle_type, :special_notes, 
  :internal_notes, :passenger_name, :passenger_number, :pick_up_address, 
  :drop_off_address, :created_at, :updated_at, :booking_date, :booking_time


  def dispatcher
    self.object.dispatcher
  end

  def driver
    self.object.driver
    
  end

  def account
    self.object.account
  end

  def vehicle
    self.object.vehicle
  end

  def booking_date
    self.object.date && self.object.date.strftime("%Y-%m-%d")
  end

  def booking_time
    self.object.pick_up_time && self.object.pick_up_time.strftime("%I:%M:%S")
  end
  
end
