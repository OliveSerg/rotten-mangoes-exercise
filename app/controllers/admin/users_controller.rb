class Admin::UsersController < ApplicationController
  before_action :restrict_access
  before_action :check_admin
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @admin_user = User.new
  end

  def edit
  end

  def create
    @admin_user = User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   flash[:success] = "User deleted"
  #   redirect_to users_url
  # end

  private
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    def admin_user_params
      params.fetch(:admin, {})
    end
end
