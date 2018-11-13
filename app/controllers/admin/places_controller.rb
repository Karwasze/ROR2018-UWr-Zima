# frozen_string_literal: true

class Admin::PlacesController < Admin::BaseController
  before_action :set_place, only: %i(edit update destroy)

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to admin_places_path, notice: 'New place added' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @place.update_attributes(place_params)
        format.html { redirect_to admin_places_path, flash: {notice: "Place successfully updated"}}
        format.json { render :show, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to admin_places_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def place_params
    params.require(:place).permit(
      :name,
      :category_id,
      :country_id,
      :description,
      :long_description,
      :price
    )
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
