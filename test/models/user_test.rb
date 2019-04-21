require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:konnor)
  end

  test 'users will not update if name already taken' do
    assert_no_difference 'User.count' do
      new_user = User.new(name: 'konnor')
      new_user.save
    end

    assert_no_difference 'User.count' do
      new_user = User.new(name: 'KoNnOr')
      new_user.save
    end
  end

  test 'users will update if name is unique' do
    assert_difference 'User.count', 1 do
      new_user = User.new(name: 'test_user')
      new_user.save
    end
  end

  test 'name cannot be longer than 50 characters' do
    assert_no_difference 'User.count' do
      new_user = User.new(name: 'a' * 51)
      new_user.save
    end
  end

  test 'name cannot be blank' do
    assert_no_difference 'User.count' do
      new_user = User.new(name: '' * 10)
      new_user.save
    end
  end
end
