class Booking < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :vehicle, optional: true
  belongs_to :dispatcher
  belongs_to :account
end
