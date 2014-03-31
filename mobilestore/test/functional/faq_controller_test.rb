require 'test_helper'

class FaqControllerTest < ActionController::TestCase
  test "should get answer1" do
    get :answer1
    assert_response :success
  end

  test "should get answer2" do
    get :answer2
    assert_response :success
  end

  test "should get answer3" do
    get :answer3
    assert_response :success
  end

  test "should get answer4" do
    get :answer4
    assert_response :success
  end

  test "should get answer5" do
    get :answer5
    assert_response :success
  end

end
