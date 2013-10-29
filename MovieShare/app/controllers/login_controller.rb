class LoginController < ActionController::Base
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id           #session is a built-in feature of rails that keep track of users logged in via userID
      redirect_to '/pages/mainpage'
    else
      redirect_to '/login/new', alert: "Invalid username/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login/new', notice: "Logged out"
  end

end
