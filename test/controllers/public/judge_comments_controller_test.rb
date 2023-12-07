require "test_helper"

class Public::JudgeCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_judge_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_judge_comments_destroy_url
    assert_response :success
  end
end
