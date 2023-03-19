class V1::RecordsController < ApplicationController
  before_action :set_user

  def index
    @records = @user.records
    render jsonapi: @records
  end

  def create
    return render jsonapi: nil, status: :unprocessable_entity unless @user

    clock_in = Time.current.utc.iso8601
    record = Record.create(user: @user, clock_in: clock_in)

    if record.valid?
      render jsonapi: @user.records, status: :created
    else
      render jsonapi: record, status: :unprocessable_entity
    end
  end

  def update
    return render jsonapi: nil, status: :unprocessable_entity unless @user

    clock_out = Time.current.utc.iso8601
    record = Record.find_by_id(record_params[:id])
    return render jsonapi: record, status: :unprocessable_entity unless record

    record.update(clock_out: clock_out, remarks: 'Complete sleep')
    if record.valid?
      render jsonapi: @user.records, status: :accepted
    else
      render jsonapi: record, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find_by_uuid(record_params[:user_id])
    end

    def record_params
      params.permit(:id, :user_id)
    end
end
