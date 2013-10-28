class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/pages/mainpage', notice: "User #{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.order(:name)
    respond_to do |format|
      format.html # index.html.erb format.json { render json: @users }
    end
  end

end
