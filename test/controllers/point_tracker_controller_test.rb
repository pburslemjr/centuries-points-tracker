require "test_helper"

class PointTrackerControllerTest < ActionDispatch::IntegrationTest
  test "should get tracker" do
    get point_tracker_tracker_url
    assert_response :success
  end
end
