class Hotel < ApplicationRecord
  has_many :rooms
  has_many :room_guests, through: :rooms
  has_many :guests, through: :room_guests

  def unique_guests
    guests.distinct
  end
end