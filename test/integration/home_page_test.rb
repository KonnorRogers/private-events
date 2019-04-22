require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test 'signup & login paths appear on home page' do
    get root_url

  end
end
