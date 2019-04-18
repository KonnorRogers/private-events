require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
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
end
