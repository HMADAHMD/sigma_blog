require "test_helper"

class FirstpageControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get firstpage_login_url
    assert_response :success
  end

  test "should get signup" do
    get firstpage_signup_url
    assert_response :success
  end
end
