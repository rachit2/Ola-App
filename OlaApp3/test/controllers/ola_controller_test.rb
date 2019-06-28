# frozen_string_literal: true

require 'test_helper'

class OlaControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get ola_home_url
    assert_response :success
  end
end
