require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it "has a valid factory" do
    expect(create(:candidate)).to be_valid
  end

  it "has a valid factory for confirmed candidates" do
    expect(create(:confirmed_candidate)).to be_valid
  end
end
