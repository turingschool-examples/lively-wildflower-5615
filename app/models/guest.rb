class Guest < ApplicationRecord
  has_many :guests_rooms
  has_many :rooms, through: :guests_rooms
end
