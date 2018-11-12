class PlacesController < ApplicationController
  def index
    @places = Place.order(created_at: :desc).limit(9)
  end

  def show
  end
end
