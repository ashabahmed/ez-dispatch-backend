class Driver < ApplicationRecord
  belongs_to :company
  has_many :bookings
end
