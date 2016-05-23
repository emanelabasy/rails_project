require 'test_helper'

class FlagnotificationsControllerTest < ActionController::TestCase
  setup do
    @flagnotification = flagnotifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flagnotifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flagnotification" do
    assert_difference('Flagnotification.count') do
      post :create, flagnotification: { addfgroup: @flagnotification.addfgroup, addfriend: @flagnotification.addfriend, delfgroup: @flagnotification.delfgroup, delfriend: @flagnotification.delfriend, message: @flagnotification.message, user_id: @flagnotification.user_id }
    end

    assert_redirected_to flagnotification_path(assigns(:flagnotification))
  end

  test "should show flagnotification" do
    get :show, id: @flagnotification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flagnotification
    assert_response :success
  end

  test "should update flagnotification" do
    patch :update, id: @flagnotification, flagnotification: { addfgroup: @flagnotification.addfgroup, addfriend: @flagnotification.addfriend, delfgroup: @flagnotification.delfgroup, delfriend: @flagnotification.delfriend, message: @flagnotification.message, user_id: @flagnotification.user_id }
    assert_redirected_to flagnotification_path(assigns(:flagnotification))
  end

  test "should destroy flagnotification" do
    assert_difference('Flagnotification.count', -1) do
      delete :destroy, id: @flagnotification
    end

    assert_redirected_to flagnotifications_path
  end
end
