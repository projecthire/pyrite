require 'rails_helper'

RSpec.describe EmployerContact, type: :model do
  it "has a valid factory" do
    expect(create(:employer_contact)).to be_valid
  end
end
