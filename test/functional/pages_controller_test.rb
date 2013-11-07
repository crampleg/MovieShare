require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get mainpage" do
    get :mainpage
    assert_response :success
  end

  test "should get profilepage" do
    get :profilepage
    assert_response :success
  end

  test "should get loginpage" do
    get :loginpage
    assert_response :success
  end

  test "should get moviepage" do
    get :moviepage
    assert_response :success
  end

  test "should get registerpage" do
    get :registerpage
    assert_response :success
  end

end
