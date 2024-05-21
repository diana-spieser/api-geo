require "test_helper"

class GeoApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get geo_api_index_url
    assert_response :success
  end
end
