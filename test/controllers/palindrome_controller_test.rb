require 'test_helper'

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get '/'
    assert_response :success
  end

  test "should get output" do
    get '/output', n: 0
    assert_response :success
  end

  test "should get 4" do
    get '/output', n: 5
    assert_equal assigns[:num], 4
  end

  test "should get 0 if negative" do
    get '/output', n: -5
    assert_equal assigns[:num], 0
  end

  test "should get 0 if letter" do
    get '/output', n: 'a'
    assert_equal assigns[:num], 0
  end

  test "should get last" do
    get '/last'
    assert_response :success
  end
end
