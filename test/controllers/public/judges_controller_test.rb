require "test_helper"

class Public::JudgesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_judges_new_url
    assert_response :success
  end

  test "should get create" do
    get public_judges_create_url
    assert_response :success
  end

  test "should get show" do
    get public_judges_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_judges_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_judges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_judges_destroy_url
    assert_response :success
  end
end
