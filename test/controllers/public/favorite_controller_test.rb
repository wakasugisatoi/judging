require "test_helper"

class Public::FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_favorite_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_favorite_destroy_url
    assert_response :success
  end
end
