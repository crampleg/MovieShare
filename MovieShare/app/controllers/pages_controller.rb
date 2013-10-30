class PagesController < ApplicationController

  def getmovie
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
end
