class Room < ApplicationRecord
  belongs_to :hotel
  has_many :stays
  has_many :guests, through: :stays
end
