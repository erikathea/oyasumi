class V1::FollowsController < ApplicationController

  def create
    begin
      user = User.find_by_uuid(follow_params['user_id'])
      followed_user = User.find_by_uuid(follow_params['followed_user_id'])
      follow = Follow.create(user_id: user.id, followed_user_id: followed_user.id)
      render jsonapi: follow, status: :created
    rescue
      render jsonapi: nil, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find_by_uuid(follow_params['user_id'])
      followed_user = User.find_by_uuid(follow_params['followed_user_id'])
      follow = Follow.where(user_id: user.id, followed_user_id: followed_user.id).first
      follow.destroy
      render jsonapi: follow, status: :ok
    rescue
      render jsonapi: nil, status: :unprocessable_entity
    end
  end

  private
    def follow_params
      params.permit(:user_id, :followed_user_id)
    end
end
