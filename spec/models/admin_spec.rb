require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "has a valid factory" do
    expect(create(:admin)).to be_valid
  end
end
