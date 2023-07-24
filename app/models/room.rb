class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_guests, dependent: :destroy
  has_many :guests, through: :room_guests
end