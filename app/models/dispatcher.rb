class Dispatcher < ApplicationRecord
  belongs_to :company
  has_many :accounts
  has_many :bookings
end
