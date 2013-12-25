require 'test_helper'

class TssControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get monitor" do
    get :monitor
    assert_response :success
  end

  test "should get rep_patch_result" do
    get :rep_patch_result
    assert_response :success
  end

  test "should get rep_tr_span" do
    get :rep_tr_span
    assert_response :success
  end

end
