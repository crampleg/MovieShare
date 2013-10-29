class LoginController < ActionController::Base
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      login[:user_id] = user.id
      redirect_to '/pages/mainpage'
    else
      redirect_to '/login/new', alert: "Invalid username/password combination"
    end
  end

  def destroy
    login[:user_id] = nil
    redirect_to '/login/new', notice: "Logged out"
  end

end
