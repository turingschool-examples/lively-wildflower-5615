require "rails_helper"

RSpec.describe Hotel, type: :model do
  describe "relationships" do
    it { should have_many :rooms }
    it {should have_many(:room_guests).through(:rooms)}
    it {should have_many(:guests).through(:room_guests)}
  end
end