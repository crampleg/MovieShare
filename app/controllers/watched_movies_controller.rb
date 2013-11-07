class WatchedMoviesController < ApplicationController
  # GET /watched_movies
  # GET /watched_movies.json
  def index
    @watched_movies = WatchedMovie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @watched_movies }
    end
  end

  # GET /watched_movies/1
  # GET /watched_movies/1.json
  def show
    @watched_movie = WatchedMovie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @watched_movie }
    end
  end

  # GET /watched_movies/new
  # GET /watched_movies/new.json
  def new
    @watched_movie = WatchedMovie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @watched_movie }
    end
  end

  # GET /watched_movies/1/edit
  def edit
    @watched_movie = WatchedMovie.find(params[:id])
  end

  # POST /watched_movies
  # POST /watched_movies.json
  def create
    @watched_movie = WatchedMovie.new(params[:watched_movie])

    respond_to do |format|
      if @watched_movie.save
        format.html { redirect_to @watched_movie, notice: 'Watched movie was successfully created.' }
        format.json { render json: @watched_movie, status: :created, location: @watched_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @watched_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /watched_movies/1
  # PUT /watched_movies/1.json
  def update
    @watched_movie = WatchedMovie.find(params[:id])

    respond_to do |format|
      if @watched_movie.update_attributes(params[:watched_movie])
        format.html { redirect_to @watched_movie, notice: 'Watched movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @watched_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watched_movies/1
  # DELETE /watched_movies/1.json
  def destroy
    @watched_movie = WatchedMovie.find(params[:id])
    @watched_movie.destroy

    respond_to do |format|
      format.html { redirect_to watched_movies_url }
      format.json { head :no_content }
    end
  end
end
