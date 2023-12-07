require "test_helper"

class Admin::FinalistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_finalists_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_finalists_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_finalists_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_finalists_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_finalists_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_finalists_update_url
    assert_response :success
  end
end
