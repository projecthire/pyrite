require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
    expect(create(:contact)).to be_valid
  end
end
