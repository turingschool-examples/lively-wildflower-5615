class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  def guest_count
    # Thorough googling tells me this is an active record method and 
    # I hope to suite (pun intended) baby jiminy cricket they're correct
    guests.count
  end
end