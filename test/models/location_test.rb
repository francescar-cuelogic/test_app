require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'presence of location name' do
    @location = FactoryGirl.create(:location)
    assert_equal @location.valid?, true, 'valid location'
  end

  test 'absence of location name' do
    @location = Location.new(name: '')
    assert_equal @location.valid?, false, 'location is invalid as name is blank'
  end

  test "should not save article without title" do
    location = Location.new
    assert_not location.save, "Saved the location with blank name"
  end
end
