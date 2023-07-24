class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guests, through: :rooms

  # def hotel_guests
  #   select("guests.* FROM guests")
  #   .joins("INNER JOIN guest_rooms ON guests.id = guest_rooms.guest_id")
  #   .where("guest_rooms.room_id = hotel_id")
  #   joins(:hotels).distinct.pluck(:name)
  # end
end