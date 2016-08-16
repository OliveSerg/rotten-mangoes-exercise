class Admin::UsersController < ApplicationController
  before_action :restrict_access
  before_action :check_admin
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  private

  def set_admin_user
    @admin_user = User.find(params[:id])
  end

  def admin_user_params
    params.fetch(:admin_user, {})
  end

end
