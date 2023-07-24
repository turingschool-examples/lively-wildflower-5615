class Guest < ApplicationRecord
  has_many :guest_rooms
  has_many :rooms, through: :guest_rooms

  def add_room
    require 'pry'; binding.pry
  end
end