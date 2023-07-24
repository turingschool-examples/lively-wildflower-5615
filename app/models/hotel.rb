class Hotel < ApplicationRecord
  has_many :rooms

  def list_unique_guests
    Guest.distinct.joins(:guest_rooms => :room).where("rooms.hotel_id = ?", self.id)
  end
end