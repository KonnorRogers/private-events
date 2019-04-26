require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'valid signup information' do
    get signup_path
    assert flash.empty?
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { name: 'fakename' } }
    end

    refute flash.empty?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test 'invalid information' do
    get signup_path
    assert flash.empty?
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: 'konnor' } }
    end

    refute flash.empty?
    assert_template 'users/new'
    refute is_logged_in?
  end
end
