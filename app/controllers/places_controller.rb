class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @place.save
      redirect_to "/places" 
    else
      flash[:notice] = "You need to Login before you can add any places!"
      redirect_to "/users/new"
    end
  end

end
