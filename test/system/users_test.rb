require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Addressl1", with: @user.addressL1
    fill_in "Addressl2", with: @user.addressL2
    fill_in "Adressl3", with: @user.adressL3
    fill_in "Cardccv", with: @user.cardCCV
    fill_in "Cardexpire", with: @user.cardExpire
    fill_in "Cardname", with: @user.cardName
    fill_in "Cardnum", with: @user.cardNum
    fill_in "Dateofbirth", with: @user.dateOfBirth
    fill_in "Email", with: @user.email
    check "Hassecurepassword" if @user.hasSecurePassword
    check "Isadmin" if @user.isAdmin
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phonenumber", with: @user.phoneNumber
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Addressl1", with: @user.addressL1
    fill_in "Addressl2", with: @user.addressL2
    fill_in "Adressl3", with: @user.adressL3
    fill_in "Cardccv", with: @user.cardCCV
    fill_in "Cardexpire", with: @user.cardExpire
    fill_in "Cardname", with: @user.cardName
    fill_in "Cardnum", with: @user.cardNum
    fill_in "Dateofbirth", with: @user.dateOfBirth
    fill_in "Email", with: @user.email
    check "Hassecurepassword" if @user.hasSecurePassword
    check "Isadmin" if @user.isAdmin
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phonenumber", with: @user.phoneNumber
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
