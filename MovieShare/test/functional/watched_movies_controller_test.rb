require 'test_helper'

class WatchedMoviesControllerTest < ActionController::TestCase
  setup do
    @watched_movie = watched_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:watched_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create watched_movie" do
    assert_difference('WatchedMovie.count') do
      post :create, watched_movie: { movies: @watched_movie.movies, user_id: @watched_movie.user_id }
    end

    assert_redirected_to watched_movie_path(assigns(:watched_movie))
  end

  test "should show watched_movie" do
    get :show, id: @watched_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @watched_movie
    assert_response :success
  end

  test "should update watched_movie" do
    put :update, id: @watched_movie, watched_movie: { movies: @watched_movie.movies, user_id: @watched_movie.user_id }
    assert_redirected_to watched_movie_path(assigns(:watched_movie))
  end

  test "should destroy watched_movie" do
    assert_difference('WatchedMovie.count', -1) do
      delete :destroy, id: @watched_movie
    end

    assert_redirected_to watched_movies_path
  end
end
