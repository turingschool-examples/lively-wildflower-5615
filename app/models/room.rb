class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guest, through: :guest_rooms
end