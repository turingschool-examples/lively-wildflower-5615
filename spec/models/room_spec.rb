require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
  end

  describe "relationships" do 
    it { should have_many :guest_rooms }
  end

  describe "relationships" do
    it { should have_many(:guests).through(:guest_rooms) }
  end
end