require "test_helper"

class Public::ComediansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_comedians_index_url
    assert_response :success
  end
end
