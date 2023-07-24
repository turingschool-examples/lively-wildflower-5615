class Hotel < ApplicationRecord
  has_many :rooms

  def prev_guests
    Guest.joins(rooms: :hotel)
    .distinct
    .pluck(:name)
  end
end