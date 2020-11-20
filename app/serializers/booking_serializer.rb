class BookingSerializer < ActiveModel::Serializer
  attributes :id, :account, :vehicle, :driver, :dispatcher, 
  :date, :pick_up_time, :drop_off_time, :trip_type, 
  :trip_status, :price, :payment_type, :vehicle_type, :special_notes, 
  :internal_notes, :passenger_name, :passenger_number, :created_at, :updated_at 

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
  
end