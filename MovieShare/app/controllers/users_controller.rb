class UsersController < ActionController::Base
  skip_before_filter :authorize
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        @user.following='0'
        @user.save
        @user.followers=0
        @user.save
        $current_user=@user;
        format.html { redirect_to '/pages/mainpage', notice: "#{@user.firstname}'s profile was successfully created!" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/pages/mainpage', notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.order(:name)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

end
