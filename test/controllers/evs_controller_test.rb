require 'test_helper'

class EvsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
