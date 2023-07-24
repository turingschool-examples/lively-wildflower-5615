require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "#instance_methods" do
    describe "number_of_guests" do
      it "can return the number of guests that have stayed in that room" do
        require 'pry';binding.pry
      end
    end
end