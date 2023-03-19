require "test_helper"

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:main_user)
    @friend1 = users(:following_back)
    @friend2 = users(:following_two)
  end

  test "display user data and sleep records" do
    get v1_user_url(@user.uuid)

    result = JSON.parse response.body
    data_result = result['data']

    assert_response :success
    assert_not_nil data_result

    data_user = data_result['attributes']
    assert_not_nil data_user

    data_record = data_result['relationships']['records']
    assert_not_nil data_record

    assert_equal 'users', data_result['type']
    assert_equal 'Bluey', data_user['username']
    assert_equal 3, data_user['following_count']
    assert_equal 2, data_user['followers_count']
    assert_equal 2, data_record['data'].count
  end

  test "display friend data and sleep records" do
    get v1_user_url(@user.uuid) # sets session[:current_user_id]
    get v1_user_friends_url(@user)

    result = JSON.parse response.body
    data_friends = result['data']

    assert_response :success
    assert_not_nil data_friends
    assert_equal 2, data_friends.count

    data_friends.each do |friend|
      assert [@friend1.uuid, @friend2.uuid].include? friend['id']
      assert_equal 2, friend['relationships']['past_week_records']['data'].count  if friend['id'] == @friend1.uuid
    end
  end

end
