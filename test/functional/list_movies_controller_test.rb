require 'test_helper'

class ListMoviesControllerTest < ActionController::TestCase
  setup do
    @list_movie = list_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_movie" do
    assert_difference('ListMovie.count') do
      post :create, list_movie: { list_id: @list_movie.list_id, movie_name: @list_movie.movie_name }
    end

    assert_redirected_to list_movie_path(assigns(:list_movie))
  end

  test "should show list_movie" do
    get :show, id: @list_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_movie
    assert_response :success
  end

  test "should update list_movie" do
    put :update, id: @list_movie, list_movie: { list_id: @list_movie.list_id, movie_name: @list_movie.movie_name }
    assert_redirected_to list_movie_path(assigns(:list_movie))
  end

  test "should destroy list_movie" do
    assert_difference('ListMovie.count', -1) do
      delete :destroy, id: @list_movie
    end

    assert_redirected_to list_movies_path
  end
end
