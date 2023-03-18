require "test_helper"

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:main_user)
  end

  test "display user sleep records and list of followers and following" do
    get v1_user_url(@user.uuid)
    binding.pry
    assert_response :success
  end

end
