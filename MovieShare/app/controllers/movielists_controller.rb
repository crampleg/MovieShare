class MovielistsController < PagesController
  
  # GET /movielists
  # GET /movielists.json
  def index
    @movielists = Movielist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movielists }
    end
  end

  # GET /movielists/1
  # GET /movielists/1.json
  def show
    @movielist = Movielist.find(params[:id])

  end

  # GET /movielists/new
  # GET /movielists/new.json
  def new
    @movielist = Movielist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movielist }
    end
  end

  # GET /movielists/1/edit
  def edit
    @movielist = Movielist.find(params[:id])
  end

  # POST /movielists
  # POST /movielists.json
  def create
    @movielist = Movielist.new(params[:movielist])

    respond_to do |format|
      if @movielist.save
        format.html { redirect_to @movielist, notice: 'Movielist was successfully created.' }
        format.json { render json: @movielist, status: :created, location: @movielist }
      else
        format.html { render action: "new" }
        format.json { render json: @movielist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movielists/1
  # PUT /movielists/1.json
  def update
    @movielist = Movielist.find(params[:id])

    respond_to do |format|
      if @movielist.update_attributes(params[:movielist])
        format.html { redirect_to @movielist, notice: 'Movielist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movielist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movielists/1
  # DELETE /movielists/1.json
  def destroy
    @movielist = Movielist.find(params[:id])
    @movielist.destroy

    respond_to do |format|
      format.html { redirect_to movielists_url }
      format.json { head :no_content }
    end
  end
end
