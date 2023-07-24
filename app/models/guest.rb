class Guest < ApplicationRecord
    validates :name, presence: true
    validates :nights, presence: true, numericality: true
    has_many :guest_rooms
    has_many :rooms, through: :guest_rooms
    has_many :hotels, through: :rooms
  end
  