class ListMoviesController < ApplicationController
  # GET /list_movies
  # GET /list_movies.json
  def index
    @list_movies = ListMovie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list_movies }
    end
  end

  # GET /list_movies/1
  # GET /list_movies/1.json
  def show
    @list_movie = ListMovie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_movie }
    end
  end

  # GET /list_movies/new
  # GET /list_movies/new.json
  def new
    @list_movie = ListMovie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list_movie }
    end
  end

  # GET /list_movies/1/edit
  def edit
    @list_movie = ListMovie.find(params[:id])
  end

  # POST /list_movies
  # POST /list_movies.json
  def create
    @list_movie = ListMovie.new(params[:list_movie])

    respond_to do |format|
      if @list_movie.save
        format.html { redirect_to @list_movie, notice: 'List movie was successfully created.' }
        format.json { render json: @list_movie, status: :created, location: @list_movie }
      else
        format.html { render action: "new" }
        format.json { render json: @list_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /list_movies/1
  # PUT /list_movies/1.json
  def update
    @list_movie = ListMovie.find(params[:id])

    respond_to do |format|
      if @list_movie.update_attributes(params[:list_movie])
        format.html { redirect_to @list_movie, notice: 'List movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_movies/1
  # DELETE /list_movies/1.json
  def destroy
    @list_movie = ListMovie.find(params[:id])
    @list_movie.destroy

    respond_to do |format|
      format.html { redirect_to list_movies_url }
      format.json { head :no_content }
    end
  end
end
