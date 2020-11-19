class Company < ApplicationRecord
  has_many :drivers
  has_many :dispatchers
  has_many :vehicles
end
