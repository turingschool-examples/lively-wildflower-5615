require "rails_helper"

RSpec.describe Hotel, type: :model do
  before(:each) do
    test_data
  end
  describe "relationships" do
    it { should have_many :rooms }
  end
end