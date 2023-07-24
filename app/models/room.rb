class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :guest

  has_many :guests
end
