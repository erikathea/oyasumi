class Record < ApplicationRecord
  before_validation :calculate_duration
  validates :clock_in, presence: true
  validates :duration, presence: true, if: :clocked_out?

  belongs_to :user

  attribute :duration, :integer, default: -> { 0 }

  def clocked_out?
    !clock_out.nil?
  end

  def calculate_duration # duration: seconds
    return unless clocked_out?
    self.duration = (self.clock_out - self.clock_in).to_i
  end

  def sleep_duration
    calculate_duration
    return unless self.duration
    ActiveSupport::Duration.build(self.duration).inspect
  end

  private
  def self.self_heal(user_id)
    # TODO DB self heal
    # Remove bad records:
    #   clocked_in > clocked_out
    #   duration =< 5.minutes
    #   clocked_out.nil and Time.current >= updated_at + 15.days
  end
end
