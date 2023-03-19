class User < ApplicationRecord
  before_create :generate_uuid
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates_length_of :records, maximum: 500 # Note: Add archiving mechanism to scale

  has_many :follows
  has_many :following, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_user_id'
  has_many :records, -> { order(clock_in: :desc) }

  attribute :uuid, :string, default: -> { SecureRandom.uuid }

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
    # TODO: Consider adding index
    records.where(clock_in: 7.days.ago..1.hour.from_now).where.not(clock_out:
nil).sort_by(&:duration).reverse
  end

end
