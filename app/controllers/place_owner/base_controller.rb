# frozen_string_literal: true

class PlaceOwner::BaseController < ApplicationController
  layout "place_owner"

  before_action :authenticate_place_owner!

  def authenticate_place_owner!
    authenticate_user!
    unless current_user.place_owner?
      redirect_back(fallback_location: places_path)
      flash[:alert] = I18n.t("authentication.error")
    end
  end
end
