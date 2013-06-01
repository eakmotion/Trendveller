class ListsController < ApplicationController

  def home
  end

  def results
    session[:search_results] = request.url
    @address = params[:address] || session[:address]
    session[:address] = params[:address] if params[:address]
    coordinates = Geocoder.coordinates(@address)
    client = Foursquare2::Client.new(:client_id => ENV["CLIENT_ID"], :client_secret => ENV["CLIENT_SECRET"])
    @venues = client.trending_venues(coordinates.join(","),{:limit => 100, :radius => 10000 }).venues
    # @venues = @venues.select { |v| v['categories'].any? { |cat| cat['name'] =~ /food/ } }

    respond_to do |format|
      format.html
      format.json { render :json => @venues }
    end

  end

  def category
    session[:search_results] = request.url
    @address = params[:address] || session[:address]
    session[:address] = params[:address] if params[:address]
    coordinates = Geocoder.coordinates(@address)
    client = Foursquare2::Client.new(:client_id => ENV["CLIENT_ID"], :client_secret => ENV["CLIENT_SECRET"])
    @venues = client.trending_venues(coordinates.join(","),{:limit => 10, :radius => 10000 }).venues
    # @venues = @venues.select { |v| v['category'].any? { |cat| cat['id'] == "4bf58dd8d48988d17f941735" } }

    respond_to do |format|
      format.html
      format.json { render :json => @venues }
    end

  end


end