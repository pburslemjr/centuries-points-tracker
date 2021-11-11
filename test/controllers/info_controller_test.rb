require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test 'should get tos' do
    get info_tos_url
    assert_response :success
  end

  test 'should get privacy' do
    get info_privacy_url
    assert_response :success
  end
end
