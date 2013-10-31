class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
  def authorize
    unless User.find_by_id(session[:user_id]) || $current_user                #the session list must contain a userID
      redirect_to '/login/new', notice: "Please log in"
    end
  end
end
