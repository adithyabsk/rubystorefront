require 'test_helper'

class LedgerEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ledger_entries_path_url
    assert_response :success
  end
end
