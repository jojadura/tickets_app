require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  test "should get total_reopen" do
    get :total_reopen
    assert_response :success
  end

  test "should get total_by_area" do
    get :total_by_area
    assert_response :success
  end

  test "should get report_supports" do
    get :report_supports
    assert_response :success
  end

  test "should get daily_report" do
    get :daily_report
    assert_response :success
  end

end
