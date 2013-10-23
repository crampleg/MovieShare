class UsersController < ActionController::Base
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "You signed up successfully"
  		flash[:color] = "valid"
  	else
  		flash[:notice] = "Form is invalid"
  		flash[:notice] = "invalid"
  	end

 	 render "new"
	end

end
