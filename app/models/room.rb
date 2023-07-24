class Room < ApplicationRecord
  belongs_to :hotel
  has_many :stays
  has_many :guests, through: :stays

  def distinct_guest_count
    stays.distinct.count(:guest_id)
  end
end
