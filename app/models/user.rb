class User < ApplicationRecord
  before_create :generate_uuid
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates_length_of :records, maximum: 500 # Note: Add archiving mechanism to scale

  has_many :follows
  has_many :following, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_user_id'
  has_many :records, -> { order(clock_in: :desc) }

  def generate_uuid
    self.uuid = SecureRandom.uuid if self.uuid.blank?
  end

  def following_count
    following.size
  end

  def followers_count
    followers.size
  end

  def past_week_records
    last_week_records = records.select{ |r| r.clock_in >= 7.days.ago && r.clock_in <= 1.hour.from_now && !r.clock_out.nil? }
  end

end
