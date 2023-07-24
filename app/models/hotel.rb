class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guests, through: :rooms

  def guest_list
    guests.distinct
  end
end