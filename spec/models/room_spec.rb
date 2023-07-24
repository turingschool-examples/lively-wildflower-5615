require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should belong_to :guest }
    it { should have_many :guests }
  end
end