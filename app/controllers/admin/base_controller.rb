# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!

  private

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_back(fallback_location: places_path)
      flash[:alert] = I18n.t("authentication.error")
    end
  end
end
