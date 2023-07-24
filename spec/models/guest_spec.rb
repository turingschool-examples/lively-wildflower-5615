require "rails_helper"

RSpec.describe Guest, type: :model do
  before(:each) do
    test_data
  end
  describe "relationiships" do
    it { should have_many(:guest_rooms) }
    it { should have_many(:rooms).through(:guest_rooms) }
  end
end