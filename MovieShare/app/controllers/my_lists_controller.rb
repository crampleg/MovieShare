class MyListsController < ApplicationController
  # GET /my_lists
  # GET /my_lists.json
  def index
    @my_lists = MyList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_lists }
    end
  end

  # GET /my_lists/1
  # GET /my_lists/1.json
  def show
    @my_list = MyList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_list }
    end
  end

  # GET /my_lists/new
  # GET /my_lists/new.json
  def new
    @my_list = MyList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_list }
    end
  end

  # GET /my_lists/1/edit
  def edit
    @my_list = MyList.find(params[:id])
  end

  # POST /my_lists
  # POST /my_lists.json
  def create
    @my_list = MyList.new(params[:my_list])

    respond_to do |format|
      if @my_list.save
        format.html { redirect_to @my_list, notice: 'My list was successfully created.' }
        format.json { render json: @my_list, status: :created, location: @my_list }
      else
        format.html { render action: "new" }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_lists/1
  # PUT /my_lists/1.json
  def update
    @my_list = MyList.find(params[:id])

    respond_to do |format|
      if @my_list.update_attributes(params[:my_list])
        format.html { redirect_to @my_list, notice: 'My list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_lists/1
  # DELETE /my_lists/1.json
  def destroy
    @my_list = MyList.find(params[:id])
    @my_list.destroy

    respond_to do |format|
      format.html { redirect_to my_lists_url }
      format.json { head :no_content }
    end
  end
end
