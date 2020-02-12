require 'test_helper'

class ReturnRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @return_request = return_requests(:one)
  end

  test "should get index" do
    get return_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_return_request_url
    assert_response :success
  end

  test "should create return_request" do
    assert_difference('ReturnRequest.count') do
      post return_requests_url, params: { return_request: { date: @return_request.date } }
    end

    assert_redirected_to return_request_url(ReturnRequest.last)
  end

  test "should show return_request" do
    get return_request_url(@return_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_return_request_url(@return_request)
    assert_response :success
  end

  test "should update return_request" do
    patch return_request_url(@return_request), params: { return_request: { date: @return_request.date } }
    assert_redirected_to return_request_url(@return_request)
  end

  test "should destroy return_request" do
    assert_difference('ReturnRequest.count', -1) do
      delete return_request_url(@return_request)
    end

    assert_redirected_to return_requests_url
  end
end
