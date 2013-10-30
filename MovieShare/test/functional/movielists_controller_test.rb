require 'test_helper'

class MovielistsControllerTest < ActionController::TestCase
  setup do
    @movielist = movielists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movielists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movielist" do
    assert_difference('Movielist.count') do
      post :create, movielist: { title: @movielist.title }
    end

    assert_redirected_to movielist_path(assigns(:movielist))
  end

  test "should show movielist" do
    get :show, id: @movielist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movielist
    assert_response :success
  end

  test "should update movielist" do
    put :update, id: @movielist, movielist: { title: @movielist.title }
    assert_redirected_to movielist_path(assigns(:movielist))
  end

  test "should destroy movielist" do
    assert_difference('Movielist.count', -1) do
      delete :destroy, id: @movielist
    end

    assert_redirected_to movielists_path
  end
end
