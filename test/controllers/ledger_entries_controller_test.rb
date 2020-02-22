require 'test_helper'

class LedgerEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ledger_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get ledger_entries_show_url
    assert_response :success
  end

  test "should get new" do
    get ledger_entries_new_url
    assert_response :success
  end

end
