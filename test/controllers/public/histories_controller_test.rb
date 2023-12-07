require "test_helper"

class Public::HistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_histories_index_url
    assert_response :success
  end
end
