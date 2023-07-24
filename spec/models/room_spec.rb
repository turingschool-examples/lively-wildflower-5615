require "rails_helper"

RSpec.describe Room, type: :model do
  before(:each) do
    test_data
  end
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many(:guest_rooms) }
    it { should have_many(:guests).through(:guest_rooms) }
  end
end