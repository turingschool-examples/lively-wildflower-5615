class Hotel < ApplicationRecord
  has_many :rooms

  def guest_list
    Guest.distinct.joins(rooms: :hotel).where(hotel: {name: self.name}).pluck(:name).join(", ")
  end
end