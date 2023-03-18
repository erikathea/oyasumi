class User < ApplicationRecord
  before_create :generate_uuid
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true

  has_many :follows
  has_many :following, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_user_id'
  has_many :records, -> { order(clock_in: :desc) }

  def generate_uuid
    self.uuid = SecureRandom.uuid if self.uuid.blank?
  end

  def following_count
    following.count
  end

  def followers_count
    followers.count
  end
end
