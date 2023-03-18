class V1::UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update ]

  def index
    @users = User.all
    render jsonapi: @users
  end

  def show
    render jsonapi: @user, include: ['following', 'followers', 'records']
  end

  private
    def set_user
      @user = User.find_by_uuid(user_params[:id])
    end

    def user_params
      params.permit(:id, :username, :first_name, :last_name)
    end
end
