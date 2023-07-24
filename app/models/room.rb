class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :hotel_rooms
  has_and_belongs_to_many :guests, join_table: :guest_rooms
end
