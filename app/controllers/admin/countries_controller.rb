# frozen_string_literal: true

class Admin::CountriesController < Admin::BaseController
  before_action :set_country, only: %i(edit update destroy)

  def index
    @q = Country.ransack(params[:q])
    @countries = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def new
    @country = Country.new
  end

  def create
    @countries = Country.new(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to admin_cuntries_path, notice: 'New country added' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @country.update_attributes(country_params)
        format.html { redirect_to admin_countries_path, flash: {notice: "Country successfully updated"}}
        format.json { render :show, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_path, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def country_params
    params.require(:country).permit(
      :name
    )
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
