require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { addressL1: @user.addressL1, addressL2: @user.addressL2, adressL3: @user.adressL3, cardCCV: @user.cardCCV, cardExpire: @user.cardExpire, cardName: @user.cardName, cardNum: @user.cardNum, dateOfBirth: @user.dateOfBirth, email: @user.email, hasSecurePassword: @user.hasSecurePassword, isAdmin: @user.isAdmin, name: @user.name, password: @user.password, phoneNumber: @user.phoneNumber } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { addressL1: @user.addressL1, addressL2: @user.addressL2, adressL3: @user.adressL3, cardCCV: @user.cardCCV, cardExpire: @user.cardExpire, cardName: @user.cardName, cardNum: @user.cardNum, dateOfBirth: @user.dateOfBirth, email: @user.email, hasSecurePassword: @user.hasSecurePassword, isAdmin: @user.isAdmin, name: @user.name, password: @user.password, phoneNumber: @user.phoneNumber } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
