require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:konnor)
  end

  test 'home page exists' do
    get root_url
    assert_response :success
  end

  test 'signup & login paths appear on home page' do
    get root_url
    assert_select 'a[href=?]', login_path, count: 1
    assert_select 'a[href=?]', signup_path, count: 1
    assert_select 'a[href=?]', root_url, count: 1
  end

  test 'signup and login links disappear when logged in' do
    get login_path
    post login_path, params: { name: @user.name }

    get root_url
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', signup_path, count: 0

    assert_select 'a[href=?]', user_path(@user), count: 1
    assert_select 'a[href=?]', logout_path, count: 1
    assert_select 'a[href=?]', events_new_path, count: 1
  end
end
