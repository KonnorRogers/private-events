# frozen_string_literal: true

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
    login_request(@user)
    get events_new_path
    assert_response :success

    assert_template 'shared/_event_form'
    assert_select 'input[type=submit]', count: 1
  end

  test 'creating an event' do
    login_request(@user)
    get events_new_path

    event = { day: Time.zone.today,
              location: 'my house',
              description: 'fun time at my house' }

    assert_difference 'Event.count', 1  do
      post events_create_path, params: { event: event }
    end

    assert_response :redirect
    follow_redirect!

    assert_match event[:day].to_s, response.body
    assert_match event[:location], response.body
    assert_match event[:description], response.body
    assert_match @user.name, response.body
  end

  test 'events index page displays all events' do
    login_request(@user)

    get events_index_path

    # events defined in events/fixtures.yml
    event1 = events(:event1)
    event2 = events(:event2)
    event3 = events(:event3)

    assert_match event1.day.to_s, response.body
    assert_match event2.day.to_s, response.body
    assert_match event3.day.to_s, response.body
  end
end
