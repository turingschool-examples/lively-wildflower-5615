require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_and_belong_to_many :guests }
  end
end