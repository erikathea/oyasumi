class V1::UsersController < ApplicationController
  include ActionController::ImplicitRender
  include ActionView::Layouts
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user, include: ['following', 'followers', 'records']
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_uuid(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name)
    end
end
