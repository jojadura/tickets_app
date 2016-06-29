require 'test_helper'

class AssistanceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get close" do
    get :close
    assert_response :success
  end

end
