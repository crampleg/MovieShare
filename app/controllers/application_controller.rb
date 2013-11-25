class ApplicationController < ActionController::Base
  #before_filter :authorize
  before_filter :setUser
  protect_from_forgery

  protected
  def authorize
    unless User.find_by_id(session[:user_id]) && $current_user                #the session list must contain a userID
      redirect_to '/login/new', notice: "Please log in"
    end
  end
  
  protected
  def setUser
    $current_user = User.find_by_id(1);
  end
end
