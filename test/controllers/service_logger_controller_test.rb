require 'test_helper'

class ServiceLoggerControllerTest < ActionDispatch::IntegrationTest
  test 'should get service' do
    get service_logger_service_url
    assert_response :success
  end
end
