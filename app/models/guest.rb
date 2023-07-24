class Guest < ApplicationRecord
  has_many :room_guests, dependent: :destroy
  has_many :rooms, through: :room_guests
end