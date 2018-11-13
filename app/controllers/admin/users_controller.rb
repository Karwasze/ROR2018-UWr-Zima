# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i(edit update destroy)

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'New user added' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to admin_users_path, flash: {notice: "User account successfully updated"}}
        format.json { render :show, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :role
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
