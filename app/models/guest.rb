class Guest < ApplicationRecord
  has_many :stays
  has_many :rooms, through: :stays
end
