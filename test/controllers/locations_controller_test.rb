class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = FactoryGirl.create(:location)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: @location
    end

    assert_redirected_to location_path(assigns(:location))
  end
end