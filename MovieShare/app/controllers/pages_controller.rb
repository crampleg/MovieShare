
class PagesController < ApplicationController

  $title = nil

  $type = "users"

  $description = "default"
  def getmovie
    $searchtype = "movies"
    require 'net/http'
    require 'json'
    
    query = params[:query]
    query.gsub! /\s+/, "+"
    url = "http://mymovieapi.com/?title=#{query}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
    
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      $movies = parsed_json

    rescue SocketError => e
      puts e.message
    end
    
    redirect_to '/pages/list'
  
  end

  def set_search_type
    redirect_to(:back)
  end

  def find_followers
    #find all followers of a user with id $current_user.id
    followers = Follower.find_all_by_user_id_model($current_user.id)
    followers_user_names = []
    followers.each do |follower|
      username = User.find(follower.user_id_follower).username
      followers_user_names.push(username)
    end
    return followers_user_names
  end

  def find_following
    #find all user the current user is following
    following = Follower.find_all_by_user_id_follower($current_user)
    following_user_names = []
    following.each do |fol|
      username = User.find(fol.user_id_model).username
      following_user_names.push(username)
    end
    return following_user_names
  end

  def find_lists
    MyList.find_all_by_owner_id($current_user.id)
  end


  def getlist
    $title = "Hello world"
  end 

  def updateprofile
    $description = params[:mytext]
    redirect_to(:back)
  end

  helper_method :find_followers, :find_following, :find_lists

end

