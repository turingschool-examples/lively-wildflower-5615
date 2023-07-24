require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
    it { should have_many(:rooms).through(:hotel_rooms) }
  end
end