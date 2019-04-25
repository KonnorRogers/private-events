require 'test_helper'

class EventCreationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:konnor)
  end

  test 'should require login before creation' do
    get events_new_path
    assert_response :redirect

    # User is not logged in yet, so redirect to login path
    follow_redirect!
    post login_path, params: { name: @user.name }
    get events_new_path
    assert_response :success

    assert_template 'shared/_event_form'
    assert_select 'input[type=submit]', count: 1
  end

  test 'creating an event' do
    post login_path, params: { name: @user.name }
    get events_new_path

    event = { day: Time.zone.today,
              location: 'my house',
              description: 'fun time at my house' }

    assert_difference 'Event.count', 1  do
      post events_create_path, params: { event: event }
    end

    assert_response :redirect
    follow_redirect!

    assert_select 'p#day', Time.zone.today
    assert_select 'p#location', 'fun time at my house'
    assert_select 'p#description', 'my house'
    assert_select 'p#creator', @user.name
  end

end
