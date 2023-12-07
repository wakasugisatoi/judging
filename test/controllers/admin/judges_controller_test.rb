require "test_helper"

class Admin::JudgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_judges_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_judges_destroy_url
    assert_response :success
  end
end
