
class PagesController < ApplicationController

  $title = nil
  $randomsearch = "randomsearch"
  $randommovie = "randommovie"
  $randomnr = "randomnr"
  $lists = "test"
  $description = "default"

    topratedsearch = "a"
    url = "http://mymovieapi.com/?title=#{topratedsearch}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      $topmovies = parsed_json

    rescue SocketError => e
      puts e.message
    end

  def search
    $searchtype = "movies"
    require 'net/http'
    require 'json'
    query = params[:query]
    $users = []

    $q = query
    if params[:type] == "users"
      usrs = User.all

      if query.length != 0
        usrs.each do |user|
          usrnm = user.username
          if usrnm.include? query
            $users.push(user)
          else

          end
        end
      end

        $type = "users"
        redirect_to '/pages/list'
    elsif params[:type] == "lists"

      $lists = MyList.all
        $type = "lists"
        redirect_to '/pages/list'
    elsif params[:type] == "movies"
      $type = "movies"
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
    else
      $randomstring = "abcdefghijklmnopqrstuvwxyz"
      $randomnr = rand(26)
      $randomnr2 = rand(10)
      $randomsearch = $randomstring[$randomnr..$randomnr]
      url = "http://mymovieapi.com/?title=#{$randomsearch}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
      begin
        response = Net::HTTP.get(URI.parse(url))
        parsed_json = ActiveSupport::JSON.decode(response)
        $randommovie = parsed_json[$randomnr2]
      rescue SocketError => e
        puts e.message
      end
      redirect_to(:back)
    end

    
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

