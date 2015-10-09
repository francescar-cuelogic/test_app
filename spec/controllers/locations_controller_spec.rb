require 'spec_helper'

describe LocationsController do
  before(:each) do
    @location = FactoryGirl.create(:location)
  end

	it "should set all necessary location information during create" do
    post :create, {:location => @location}
	end
end
