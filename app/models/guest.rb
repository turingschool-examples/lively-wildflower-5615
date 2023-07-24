class Guest < ApplicationRecord
  has_many :rooms

  belongs_to :room
end
