require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should have_many :room_guests }
    it { should have_many :guests }
  end
end