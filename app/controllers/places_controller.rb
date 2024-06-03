class PlacesController < ApplicationController

  def index
    @places = Place.all
    
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @place
      # Fetch entries for the specific place and user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      flash["notice"] = "Place not found."
      redirect_to "/places"
    end
  end

  def new
  end

  def create
    if User.find_by({ "id" => session["user_id"] }) != nil
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
 
    redirect_to "/places"
  else
    flash["notice"] = "You have to be logged in."
    redirect_to "/login"
  end
  end

end
