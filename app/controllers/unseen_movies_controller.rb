class UnseenMoviesController < ApplicationController
  # GET /unseen_movies
  # GET /unseen_movies.json
  def index
    @unseen_movies = UnseenMovie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unseen_movies }
    end
  end

  # GET /unseen_movies/1
  # GET /unseen_movies/1.json
  def show
    @unseen_movie = UnseenMovie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unseen_movie }
    end
  end

  # GET /unseen_movies/new
  # GET /unseen_movies/new.json
  def new
    @unseen_movie = UnseenMovie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unseen_movie }
    end
  end

  # GET /unseen_movies/1/edit
  def edit
    @unseen_movie = UnseenMovie.find(params[:id])
  end

  # POST /unseen_movies
  # POST /unseen_movies.json
  def create
    @unseen_movie = UnseenMovie.new(params[:unseen_movie])

    respond_to do |format|
      if @unseen_movie.save
        format.html { redirect_to @unseen_movie, notice: 'Unseen movie was successfully created.' }
        format.json { render json: @unseen_movie, status: :created, location: @unseen_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @unseen_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unseen_movies/1
  # PUT /unseen_movies/1.json
  def update
    @unseen_movie = UnseenMovie.find(params[:id])

    respond_to do |format|
      if @unseen_movie.update_attributes(params[:unseen_movie])
        format.html { redirect_to @unseen_movie, notice: 'Unseen movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unseen_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unseen_movies/1
  # DELETE /unseen_movies/1.json
  def destroy
    @unseen_movie = UnseenMovie.find(params[:id])
    @unseen_movie.destroy

    respond_to do |format|
      format.html { redirect_to unseen_movies_url }
      format.json { head :no_content }
    end
  end
end
