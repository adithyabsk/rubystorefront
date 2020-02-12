require "application_system_test_case"

class RestrictedRequestsTest < ApplicationSystemTestCase
  setup do
    @restricted_request = restricted_requests(:one)
  end

  test "visiting the index" do
    visit restricted_requests_url
    assert_selector "h1", text: "Restricted Requests"
  end

  test "creating a Restricted request" do
    visit restricted_requests_url
    click_on "New Restricted Request"

    click_on "Create Restricted request"

    assert_text "Restricted request was successfully created"
    click_on "Back"
  end

  test "updating a Restricted request" do
    visit restricted_requests_url
    click_on "Edit", match: :first

    click_on "Update Restricted request"

    assert_text "Restricted request was successfully updated"
    click_on "Back"
  end

  test "destroying a Restricted request" do
    visit restricted_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restricted request was successfully destroyed"
  end
end
