require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get your-purchases" do
    get :your-purchases
    assert_response :success
  end

  test "should get your-sales" do
    get :your-sales
    assert_response :success
  end

end
