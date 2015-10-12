require 'rails_helper'

RSpec.describe Location, :type => :model do
  context "Associations" do
    it { should have_many(:location_predictions) }
  end
  context "Validations" do
    it 'has a valid location name' do
      expect(build(:location)).to be_valid
    end

    it 'is invalid without a year' do
      expect(build(:location, name: nil)).to_not be_valid
    end
  end
end
