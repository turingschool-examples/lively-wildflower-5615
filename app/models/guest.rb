class Guest < ApplicationRecord
  has_many :stays
  has_many :rooms, through: :stays

  def add_room(room_id)
    rooms << Room.find(room_id)
  end
end
