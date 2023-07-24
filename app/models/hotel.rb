class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guests, through: :rooms

  def guest_list
    # I also googled this eleventeen thousand times to ensure it's active record but
    # TBD...
    guests.distinct
  end
end