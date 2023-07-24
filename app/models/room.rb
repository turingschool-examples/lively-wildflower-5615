class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_guests
  has_many :guests, through: :room_guests

  def hotel_name
    hotel.name
  end

  def total_guests
    guests.count
  end
end