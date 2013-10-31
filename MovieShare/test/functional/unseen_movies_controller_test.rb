require 'test_helper'

class UnseenMoviesControllerTest < ActionController::TestCase
  setup do
    @unseen_movie = unseen_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unseen_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unseen_movie" do
    assert_difference('UnseenMovie.count') do
      post :create, unseen_movie: { movie_name: @unseen_movie.movie_name, owner_id: @unseen_movie.owner_id }
    end

    assert_redirected_to unseen_movie_path(assigns(:unseen_movie))
  end

  test "should show unseen_movie" do
    get :show, id: @unseen_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unseen_movie
    assert_response :success
  end

  test "should update unseen_movie" do
    put :update, id: @unseen_movie, unseen_movie: { movie_name: @unseen_movie.movie_name, owner_id: @unseen_movie.owner_id }
    assert_redirected_to unseen_movie_path(assigns(:unseen_movie))
  end

  test "should destroy unseen_movie" do
    assert_difference('UnseenMovie.count', -1) do
      delete :destroy, id: @unseen_movie
    end

    assert_redirected_to unseen_movies_path
  end
end
