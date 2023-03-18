require "test_helper"

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:main_user)
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
    assert_equal 1, data_user['followers_count']
    assert_equal 2, data_record['data'].count
  end

end
