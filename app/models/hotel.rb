class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy 
  has_many :guests, through: :rooms
end