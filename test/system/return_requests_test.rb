require "application_system_test_case"

class ReturnRequestsTest < ApplicationSystemTestCase
  setup do
    @return_request = return_requests(:one)
  end

  test "visiting the index" do
    visit return_requests_url
    assert_selector "h1", text: "Return Requests"
  end

  test "creating a Return request" do
    visit return_requests_url
    click_on "New Return Request"

    fill_in "Date", with: @return_request.date
    click_on "Create Return request"

    assert_text "Return request was successfully created"
    click_on "Back"
  end

  test "updating a Return request" do
    visit return_requests_url
    click_on "Edit", match: :first

    fill_in "Date", with: @return_request.date
    click_on "Update Return request"

    assert_text "Return request was successfully updated"
    click_on "Back"
  end

  test "destroying a Return request" do
    visit return_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Return request was successfully destroyed"
  end
end
