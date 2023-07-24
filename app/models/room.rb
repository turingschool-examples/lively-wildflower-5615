class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guests_rooms
  has_many :guests, through: :guests_rooms
end