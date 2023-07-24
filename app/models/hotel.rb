class Hotel < ApplicationRecord
  has_many :rooms

  def list_of_guests
    Guest.joins(:guest_rooms).where(guest_rooms: { room: rooms }).distinct
  end
end