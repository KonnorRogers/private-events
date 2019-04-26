require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:konnor)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { name: '' }
    assert_template 'sessions/new'
    assert_not flash.empty?

    # tests that the flash disappears
    get root_path
    assert flash.empty?
  end

  test 'login with valid information followed by logout' do
    # LOGIN
    get login_path
    post login_path, params: { name: @user.name }

    assert_redirected_to @user
    follow_redirect!

    assert_template 'users/show'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path, count: 1
    assert_select 'a[href=?]', root_url, count: 1

    # LOGOUT
    delete logout_path
    refute is_logged_in?

    assert_redirected_to root_url
    follow_redirect!

    refute flash.empty?
    assert_select 'a[href=?]', login_path, count: 2
    assert_select 'a[href=?]', signup_path, count: 2
    assert_select 'a[href=?]', user_path(@user), count: 0
    assert_select 'a[href=?]', logout_path, count: 0
  end
end
