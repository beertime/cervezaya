require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get press" do
    get :press
    assert_response :success
  end
  test "should get contact" do
    get :contact
    assert_response :success
  end
  test "should get legal" do
    get :legal
    assert_response :success
  end
end
