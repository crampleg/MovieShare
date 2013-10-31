class LoginController < ActionController::Base
  #skip_before_filter :authorize   #everyone can access the methods in this controller by logging in (whitelisting)
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id           #session is a built-in feature of rails that keep track of users logged in via userID
      $current_user = user  #sets the current user to the global value $user
      user.following = 0
      user.followers = 0
      user.save
      redirect_to '/pages/mainpage', notice: "Welcome #{user.firstname}!"
    else
      redirect_to '/login/new', alert: "Invalid username/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    $current_user = nil
    redirect_to '/login/new', notice: "Logged out"
  end

end
