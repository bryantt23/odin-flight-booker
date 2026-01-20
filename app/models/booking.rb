class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
