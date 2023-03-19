class V1::UsersController < ApplicationController
  before_action :set_user_session, only: %i[ show ]
  before_action :set_user, only: %i[ show friends ]

  def index
    @users = User.all
    render jsonapi: @users
  end

  def show
    # Note: Technically acts as the 'login in' for demo purposes only
    render jsonapi: @user, include: ['following', 'followers', 'records']
  end

  def friends
    render jsonapi: @user.try(:friends), include: ['past_week_records']
  end

  private
    def set_user_session
      session[:current_user_id] = params[:id]
      @user = User.find_by_uuid(session[:current_user_id])
    end

    def set_user
      @user = User.find_by_uuid(session[:current_user_id]) if @user.nil? && !session[:current_user_id].blank?
    end

    def user_params
      params.permit(:user_id, :username, :first_name, :last_name)
    end

end
