
class PagesController < ApplicationController
  require 'net/http'
  require 'json'
  $title = nil
  $randomsearch = "randomsearch"
  $randommovie = "randommovie"
  $randomnr = "randomnr"
  $lists = "test"
  $description = "default"
  $lol = "lol"
  $test = "lolololol"
  $list_id = "0"

  $l_id = "0"
  $m_id = "0"
  $listmovies = []

    topratedsearch = "p"
    url = "http://mymovieapi.com/?title=#{topratedsearch}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      $topmovies = parsed_json

    rescue SocketError => e
      puts e.message
    end
  
  def search
    query = params[:query]         #the input string that the user wrote in the search field
    $users = []
    $q = query
    $lol = params[:type]           #the radio button value the use set (movies, users, lists)
    if params[:type] == "users"    #if the user checked the 'Users' radio button
      usrs = User.all              #find all users

      if query.length != 0         #check that the input string is not empty
        usrs.each do |user|        
          usrnm = user.username    #for every user, find the user name
          if usrnm.include? query  #if the user name includes the search input string 
            $users.push(user)      #then add the user to the list that is presented as search results 
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
    followers_user_ids = []
    followers.each do |follower|
      user_id = User.find(follower.user_id_follower).id
      followers_user_ids.push(user_id)
    end
    return followers_user_ids
  end

  def find_following
    #find all user the current user is following
    following = Follower.find_all_by_user_id_follower($current_user.id)
    following_user_ids = []
    following.each do |fol|
      user_id = User.find(fol.user_id_model).id
      following_user_ids.push(user_id)
    end
    return following_user_ids
  end
  
  def find_visited_followers
    #find all followers of a user with id $current_user.id
    followers = Follower.find_all_by_user_id_model($current_visited_user.id)
    followers_user_ids = []
    followers.each do |follower|
      user_id = User.find(follower.user_id_follower).id
      followers_user_ids.push(user_id)
    end
    return followers_user_ids
  end
  
  def find_visited_following
    #find all user the current user is following
    following = Follower.find_all_by_user_id_follower($current_visited_user.id)
    following_user_ids = []
    following.each do |fol|
      user_id = User.find(fol.user_id_model).id
      following_user_ids.push(user_id)
    end
    return following_user_ids
  end

  def find_lists
    MyList.find_all_by_owner_id($current_user.id)
  end
  
  def find_visited_lists
    MyList.find_all_by_owner_id($current_visited_user.id)
  end

  def getlist
    $title = "Hello world"
  end 

  def getmovie
    $lol = "HAHAHAHAHAHAHHAHAHA"
    $type ="movies"
    $test = params[:id]
    url = "http://mymovieapi.com/?id=#{$test}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      $movies = parsed_json
      $movies = [ $movies ]
     rescue SocketError => e
        puts e.message
    end
    redirect_to '/pages/list'
  end 

  def addmovie 
    $m_id = params[:movieid]
    type = params[:type]
    if (type == "regular")
      $l_id = params[:list]
      ListMovie.create(:list_id => params[:list], :movie_name => params[:movieid])
    elsif (type == "wishlist")
      UnseenMovie.create(:owner_id => $current_user.id, :movie_name => params[:movieid] )
    end
    redirect_to '/pages/list'
  end

  def updateprofile                 #this function is called when a user clicks a list he has created in profilepage
    type = params[:type]
    $listmovies = [] 
    if (type == "regular")
      $list_id = params[:list]        #the list_id is sent as a parameter               
      ListMovie.find_all_by_list_id($list_id).each do |movie|
        begin
          url = "http://mymovieapi.com/?id=#{movie.movie_name}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
          response = Net::HTTP.get(URI.parse(url))
          parsed_json = ActiveSupport::JSON.decode(response)
          $listmovies.push(parsed_json)
        rescue SocketError => e
          puts e.message
        end
      end
    elsif (type == "wishlist")
      UnseenMovie.find_all_by_owner_id($current_user.id).each do |movie|
        begin
          url = "http://mymovieapi.com/?id=#{movie.movie_name}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
          response = Net::HTTP.get(URI.parse(url))
          parsed_json = ActiveSupport::JSON.decode(response)
          $listmovies.push(parsed_json)
        rescue
        end
      end
    end
    $description = params[:mytext]
    redirect_to(:back)
  end
  
  
  def gotoprofile_or_addfollower
    user = params[:user_id] 
    type = params[:type]
    $current_visited_user = User.find_by_id(user) 
    if (type == "gotoprofile")   
    elsif (type == "addfollower")
      Follower.create(:user_id_model => $current_visited_user.id, :user_id_follower => $current_user.id)
    end
    redirect_to '/pages/profile'
  end
  
  def get_watched_movies
    list = []
    list_of_movies = WatchedMovie.find_by_user_id($current_user.id).movies.split(";")  #splits the string of watched movies into a list
    list_of_movies.each do |movie_id|
     url = "http://mymovieapi.com/?id=#{movie_id.movies}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"  
     response = Net::HTTP.get(URI.parse(url))
     parsed_json = ActiveSupport::JSON.decode(response)
     list.push(parsed_json)
    end
    return list
  end

  helper_method :find_followers, :find_following, :find_visited_followers, :find_visited_following, :find_lists, :find_visited_lists, :search, :get_watched_movies

end

