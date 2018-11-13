# frozen_string_literal: true

class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i(edit update destroy)

  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(place_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'New category added' }
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
      if @category.update_attributes(category_params)
        format.html { redirect_to admin_categories_path, flash: {notice: "Category successfully updated"}}
        format.json { render :show, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
