class Account < ApplicationRecord
  belongs_to :dispatcher
  has_many :bookings
end
