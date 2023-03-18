require "test_helper"

class V1::RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:main_user)
  end

  test "user clocks in" do
    assert_equal 2, @user.records.count

    post v1_user_records_path(@user.uuid)
    assert_response :success

    result = JSON.parse response.body
    data_result = result['data']
    assert_not_nil data_result
    assert_equal 3, data_result.count
  end

  test "user clocks out" do
    record = @user.records.where(clock_out: nil).first
    assert_not_equal record.remarks, 'Complete sleep'

    put v1_user_record_path(@user.uuid, record)
    assert_response :success

    result = JSON.parse response.body
    data_result = result['data']
    data_record = data_result.select{ |x| x['id']==record.id.to_s }.first
    assert_not_nil data_record
    assert_equal 'records', data_record['type']
    assert_not_nil data_record['attributes']['clock_out']
    assert_kind_of Time, Time.parse(data_record['attributes']['clock_out'])
    assert_equal 'Complete sleep', data_record['attributes']['remarks']
  end
end
