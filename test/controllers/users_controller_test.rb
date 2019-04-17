require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:konnor)
    @other_user = users(:evelyn)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test 'when not logged in, redirects to login path' do
    get root_url
    assert_redirected_to login_path
  end
end
