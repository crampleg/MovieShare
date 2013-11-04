class PagesController < ApplicationController
  $randommovie = nil
  def getmovie
    require 'net/http'
    require 'json'

    # random movie query
    #if params[:query] == nil
    #  words = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o"]
    #  random = rand(words.size)
    #  word = words[random]

    #  begin
    #  url = "http://mymovieapi.com/?title=#{word}&type=json&plot=simple&episode=0&limit=1&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
    #  response = Net::HTTP.get(URI.parse(url))
    #  parsed_json = ActiveSupport::JSON.decode(response)
    #  rescue SocketError => e
    #    puts e.message
    #  end
   #   $randommovie = parsed_json
   #   redirect_to(:back)

      #not_found = true
      #while not_found
      #  random_nr = rand(10000000)
      #  rn = random_nr.to_s
      #  while rn.length != 7
      #    rn = "0" + rn
      #  end
      #  logger.info "done"
      #  logger.info rn
      #  url = "http://mymovieapi.com/?id=tt#{random_nr}&type=json&plot=none&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0"
      #  response = Net::HTTP.get(URI.parse(url))
      #  parsed_json = ActiveSupport::JSON.decode(response)

        
      #    if parsed_json.size != 2
      #      if parsed_json["poster"] != nil
      #        if parsed_json["rating"] != nil
      #          if parsed_json["rating"] > 7
      #            not_found = false
      #          end 
      #        end
      #      end
      #    end      

    # movie by title
    #else 
      query = params[:query]
      query.gsub! /\s+/, "+"
      url = "http://mymovieapi.com/?title=#{query}&type=json&plot=simple&episode=0&limit=10&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0"
      
      begin
        response = Net::HTTP.get(URI.parse(url))
        parsed_json = ActiveSupport::JSON.decode(response)
        $movies = parsed_json
        logger.info $movies
      rescue SocketError => e
        puts e.message
      end
      
      redirect_to '/pages/list'
    #end
     
  end

  def getrandommovie

  end

  def find_followers
    #find all followers of a user with id $current_user.id
    Follower.find_all_by_user_id_model(2)
  end

def getmylists
 $mylist = User.getmylists
   
end

end

