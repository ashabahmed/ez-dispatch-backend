class Booking < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :vehicle, optional: true
  belongs_to :dispatcher
  belongs_to :account

  def self.ordered
    Booking.all.order(pick_up_time: :asc)
  end

end
