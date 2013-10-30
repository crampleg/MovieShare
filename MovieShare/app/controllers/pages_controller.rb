class PagesController < ApplicationController

  def getmovie
    require 'net/http'
    require 'json'

    query = params[:query]
    query.gsub! /\s+/, "+"
    url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=6ayr4sd4j3jrhr5srzu5rc8n&q=#{query}&page_limit=10"
    begin
      response = Net::HTTP.get(URI.parse(url))
      parsed_json = ActiveSupport::JSON.decode(response)
      logger.info parsed_json
    rescue SocketError => e
      puts e.message
    end

    $listsize = 0
    $total = parsed_json["total"]
    if $total >= 10
      $listsize = 10
    else 
      $listsize = $total
    end

    $j = 0
    $movies = {}
    for i in (1..$listsize)
      $movies[i] = {
        poster: $parsed_json["movies"][$j]["posters"]["original"]
      }
      $j += 1
    end

    $id = parsed_json["movies"][0]["id"]
    $title = parsed_json["movies"][0]["title"]
    $year = parsed_json["movies"][0]["year"]
    $rating = parsed_json["movies"][0]["mpaa_rating"]
    $runtime = parsed_json["movies"][0]["runtime"]
    $theater = parsed_json["movies"][0]["release_dates"]["theater"]
    $dvd = parsed_json["movies"][0]["release_dates"]["dvd"]
    $synopsis = parsed_json["movies"][0]["synopsis"]
    $poster = parsed_json["movies"][0]["posters"]["original"]

    redirect_to '/pages/list'
  end

    #find all followers of a user with id $current_user.id
    @list_of_followers = Follower.find($current_user.id)


end

