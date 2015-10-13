require 'rails_helper'
require 'shoulda/matchers'


RSpec.describe Location, :type => :model do
  before :each do
    @location = FactoryGirl.create(:location)
    @location_without_name = Location.create(name: nil)
  end

  context "Associations" do
    it { should have_many(:location_predictions) }
  end

  it '#new: creating location instance' do
    @location.should be_an_instance_of Location
  end

  context "Validations" do
    it 'has a valid location name' do
      expect(@location).to be_valid
    end

    it 'is invalid without a name' do
      expect(@location_without_name).to_not be_valid
    end
  end

end
