class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guest, through: :guest_rooms

  def guest_count
    guest_rooms.count
  end
end