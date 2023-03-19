require "test_helper"

class V1::FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:following_one)
    @to_follow_user = users(:following_two)
    @to_unfollow_user = users(:main_user)
  end

  test 'follows user' do
    assert_equal 0, @user.following.count
    post v1_follow_path(user_id: @user.uuid, followed_user_id: @to_follow_user.uuid)

    assert_response :success
    result = JSON.parse response.body
    assert_equal @to_follow_user.uuid, result['data']['id']
    assert_equal 1, @user.following.count
  end

  test 'unfollows user' do
    assert_equal 1, @to_follow_user.following.count
    post v1_unfollow_path(user_id: @to_follow_user.uuid, followed_user_id: @to_unfollow_user.uuid)

    assert_response :success
    assert_equal 0, @to_follow_user.following.count
  end
end
