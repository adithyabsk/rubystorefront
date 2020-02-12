require 'test_helper'

class RestrictedRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restricted_request = restricted_requests(:one)
  end

  test "should get index" do
    get restricted_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_restricted_request_url
    assert_response :success
  end

  test "should create restricted_request" do
    assert_difference('RestrictedRequest.count') do
      post restricted_requests_url, params: { restricted_request: {  } }
    end

    assert_redirected_to restricted_request_url(RestrictedRequest.last)
  end

  test "should show restricted_request" do
    get restricted_request_url(@restricted_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_restricted_request_url(@restricted_request)
    assert_response :success
  end

  test "should update restricted_request" do
    patch restricted_request_url(@restricted_request), params: { restricted_request: {  } }
    assert_redirected_to restricted_request_url(@restricted_request)
  end

  test "should destroy restricted_request" do
    assert_difference('RestrictedRequest.count', -1) do
      delete restricted_request_url(@restricted_request)
    end

    assert_redirected_to restricted_requests_url
  end
end
