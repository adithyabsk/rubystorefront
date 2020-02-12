require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    check "Agerestricted" if @item.ageRestricted
    fill_in "Brand", with: @item.brand
    fill_in "Cost", with: @item.cost
    fill_in "Name", with: @item.name
    fill_in "Quantity", with: @item.quantity
    check "Restricted" if @item.restricted
    fill_in "Taxslab", with: @item.taxSlab
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    check "Agerestricted" if @item.ageRestricted
    fill_in "Brand", with: @item.brand
    fill_in "Cost", with: @item.cost
    fill_in "Name", with: @item.name
    fill_in "Quantity", with: @item.quantity
    check "Restricted" if @item.restricted
    fill_in "Taxslab", with: @item.taxSlab
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
