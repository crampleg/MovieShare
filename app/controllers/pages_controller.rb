
class PagesController < ApplicationController
  skip_before_filter :authorize  #everyone has access to all pages
  require 'net/http'
  require 'json'

  $title = nil
  $randomsearch = "randomsearch"
  $randommovie = "randommovie"
  $randomnr = "randomnr"
  
  $profilepic = ""
  $lol = "lol"
  $test = "lolololol"
  $list_id = "0"

  $l_id = "0"
  $m_id = "0"
  $listmovies = []
  $hei = "dust"
  def getactivities 
    topratedsearch = "a"
    url = "http://mymovieapi.com/?title=#{topratedsearch}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      $topmovies = parsed_json

    rescue SocketError => e
      puts e.message
    end
  
    $hei = "hallo"
    #following records:
    $following_act = []
    $following_act = Follower.find_all_by_user_id_follower($current_user.id)
    
    #following ids:
    $following_ids = []
    $following_act.each do |act|
      $following_ids.push act.user_id_model
    end

    $activities = []
    $activities = Activity.all(:order => "created_at desc")

    $myactivities = []

    $activities.each do |activity|
      if $following_ids.include? activity.userid
        $myactivities.push activity
      end
    end
    return $myactivities
  end
  
    
  
  def search
    query = params[:query]         #the input string that the user wrote in the search field
    $users = []
    $lists = []
    $q = query
    counter = 0
    $lol = params[:type]           #the radio button value the use set (movies, users, lists)
    if params[:type] == "users"    #if the user checked the 'Users' radio button
      #usrs = User.all              #find all users
      user = User.find_by_username(query);
      #if query.length != 0         #check that the input string is not empty
       # usrs.each do |user|        
        #  usrnm = user.username.downcase    #for every user, find the user name
         # if usrnm.include? query.downcase 
          #  counter += 1
          if (user) 
            $users.push(user)      #then add the user to the list that is presented as search results 
          end
            #else

            #end
          #if counter == 10
            #break
            #end
          #end
      #end
        $type = "users"
        redirect_to '/pages/list'
    elsif params[:type] == "lists"
      listz = MyList.all              #find all users

      if query.length != 0         #check that the input string is not empty
        listz.each do |list|        
          lis = list.list_name.downcase    #for every user, find the user name
          if lis.include? query.downcase  #if the user name includes the search input string 
            counter += 1
            $lists.push(list)      #then add the user to the list that is presented as search results 
          else

          end
          if counter == 10
            break
          end
        end
      end
        $type = "lists"
        redirect_to '/pages/list'
    elsif params[:type] == "movies"
      $type = "movies"
      query.gsub! /\s+/, "+"
      uri = URI.parse("http://mymovieapi.com/?title=#{query}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0")
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request.initialize_http_header({"User-Agent" => "My Ruby Script"})
      response = http.request(request)
      parsed_json = ActiveSupport::JSON.decode(response.body)
      $movies = parsed_json
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
    followers = Rails.cache.fetch(:followers) do 
      Follower.find_all_by_user_id_model($current_user.id)
    end
    followers_user_ids = []
    followers.each do |follower|
      user_id = User.find(follower.user_id_follower).id
      followers_user_ids.push(user_id)
    end
    return followers_user_ids
  end

  def find_following
    #find all user the current user is following
    following = Rails.cache.fetch(:following) do 
      Follower.find_all_by_user_id_follower($current_user.id)
    end
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
    Rails.cache.fetch(:mylists) do 
      MyList.find_all_by_owner_id($current_user.id)
    end
  end
  
  def find_visited_lists
    MyList.find_all_by_owner_id($current_visited_user.id)
  end

  def getlist
    $title = "Hello world"
  end 

  def getmovie
    $type = "movies"
    movie_id = params[:id]
    url = "http://mymovieapi.com/?id=#{movie_id}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
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
      Activity.create(:userid => $current_user.id, :username => $current_user.username, :movieid => params[:movieid], :moviename => params[:moviename], :listid => params[:list], :listname => params[:listname])
    elsif (type == "wishlist")
      UnseenMovie.create(:owner_id => $current_user.id, :movie_name => params[:movieid] )
    elsif (type == "seen")
      user_watched = WatchedMovie.find_by_user_id($current_user.id)
      if (user_watched.movies == "") 
        movie_string = params[:movieid]
      else
        movie_string = user_watched.movies + ";" + params[:movieid]
      end
      user_watched.movies = movie_string
      user_watched.save
    end

    if params[:redir] == "main"
      redirect_to :back
    else
      redirect_to '/pages/list'
    end
  end

  def updateprofile                 #this function is called when a user clicks a list he has created in profilepage
    type = params[:type]
    $listmovies = [] 
    if (type == "regular")
      $list_id = params[:list]        #the list_id is sent as a parameter               
      list_of_movies = ListMovie.find_all_by_list_id($list_id)    #cant cache because you can switch between different lists
      list_of_movies.each do |movie|
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
      list_of_unseen_movies = Rails.cache.fetch(:list_of_unseen_movies_from_list) do
          UnseenMovie.find_all_by_owner_id($current_user.id)
      end
      list_of_unseen_movies.each do |movie|
        begin
          url = "http://mymovieapi.com/?id=#{movie.movie_name}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
          response = Net::HTTP.get(URI.parse(url))
          parsed_json = ActiveSupport::JSON.decode(response)
          $listmovies.push(parsed_json)
        rescue
        end
      end
    elsif (type == "description")
      $current_user.description = params[:description]
      $current_user.save
    end     
    redirect_to(:back)      
  end
  
  
  def gotoprofile_or_addfollower
    user = params[:user_id] 
    type = params[:type]
    $current_visited_user = User.find_by_id(user) 
    if type == "gotoprofile"
      if ($current_user.id == $current_visited_user.id)
        redirect_to '/pages/profilepage'
      else
        redirect_to '/pages/profile'   
      end
    elsif type == "addfollower"
        Follower.create(:user_id_model => $current_visited_user.id, :user_id_follower => $current_user.id)
        redirect_to '/pages/profile'
    elsif type == "list"
        $listmovies = []
        list_of_movies = ListMovie.find_all_by_list_id(params[:list])
        list_of_movies.each do |movie|
        begin
          url = "http://mymovieapi.com/?id=#{movie.movie_name}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
          response = Net::HTTP.get(URI.parse(url))
          parsed_json = ActiveSupport::JSON.decode(response)
          $listmovies.push(parsed_json)
        rescue SocketError => e
          puts e.message
        end

      end
      redirect_to '/pages/profile'
    end
  end
  
  def get_watched_movies
    list = []
    list_of_movies = Rails.cache.fetch(:list_of_watched_movies) do 
      WatchedMovie.find_by_user_id($current_user.id).movies.split(";")  #splits the string of watched movies into a list
    end
    list_of_movies.each do |movie_id|
     url = "http://mymovieapi.com/?id=#{movie_id}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"  
     response = Net::HTTP.get(URI.parse(url))
     parsed_json = ActiveSupport::JSON.decode(response)
     list.push(parsed_json)
    end
    return list
  end
  
  def get_visited_watched_movies
    list = []
    list_of_movies = Rails.cache.fetch(:list_of_visited_watched_movies) do 
      WatchedMovie.find_by_user_id($current_visited_user.id).movies.split(";")  #splits the string of watched movies into a list
    end
    list_of_movies.each do |movie_id|
     url = "http://mymovieapi.com/?id=#{movie_id}&type=json&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"  
     response = Net::HTTP.get(URI.parse(url))
     parsed_json = ActiveSupport::JSON.decode(response)
     list.push(parsed_json)
    end
    return list
  end

  def get_following_count
    Rails.cache.fetch(:following_count) do
      Follower.count(:conditions => "user_id_follower = #{$current_user.id}")
    end
  end
  
  def get_followers_count
    Rails.cache.fetch(:followers_count) do
      Follower.count(:conditions => "user_id_model = #{$current_user.id}")
    end
  end

  helper_method :find_followers, :find_following, :find_visited_followers, :find_visited_following, :find_lists, :find_visited_lists, :search, :get_watched_movies, :get_visited_watched_movies, :getactivities, :get_following_count, :get_followers_count

end



